/**
 * @description       :
 * @author            : Soulberto Lorenzo <soulberto@cloudblue.us>
 * @group             :
 * @last modified on  : 10-13-2023
 * @last modified by  : Soulberto Lorenzo <soulberto@cloudblue.us>
 **/
public with sharing class SURACCMManager {
  /**
   * @description
   * @author Soulberto Lorenzo <soulberto@cloudblue.us> | 10-13-2023
   * @param policyId
   **/
  public static void sendCCM(String policyId) {
    vlocity_ins.DRProcessResult CCMResult = vlocity_ins.DRGlobal.process(
      new Map<String, Object>{ 'Name' => 'SURABienvenida' },
      'CCM_ObtenerDatosConfiguracion'
    );
    Map<String, Object> CCMDataMap = (Map<String, Object>) CCMResult.convertToMap();

    vlocity_ins.DRProcessResult PayerResult = vlocity_ins.DRGlobal.process(
      new Map<String, Object>{ 'PolicyId' => policyId },
      'CCM_ObtenerDatosResponsableDePagoByPolicyId'
    );
    Map<String, Object> payerDataMap = (Map<String, Object>) PayerResult.convertToMap()
      .get('returnResultsData');

    vlocity_ins.DRProcessResult InsuredResult = vlocity_ins.DRGlobal.process(
      new Map<String, Object>{ 'PolicyId' => policyId },
      'CCM_ObtenerDatosAseguradoByPolicyId'
    );
    Map<String, Object> insuredDataMap = (Map<String, Object>) InsuredResult.convertToMap()
      .get('returnResultsData');

    vlocity_ins.DRProcessResult policyResult = vlocity_ins.DRGlobal.process(
      new Map<String, Object>{ 'PolicyId' => policyId },
      'CCM_ObtenerDatosPolizaByPolicyId'
    );
    Map<String, Object> policyDataMap = (Map<String, Object>) policyResult.convertToMap()
      .get('returnResultsData');

    String quoteId = (String) policyDataMap.get('PolicySourceQuoteId');
    System.debug(quoteId);
    vlocity_ins.DRProcessResult coverageResult = vlocity_ins.DRGlobal.process(
      new Map<String, Object>{ 'QuoteId' => quoteId },
      'CCM_ObtenerDatosPolizaCoberturasByPolicyIdV2'
    );
    Map<String, Object> coverageDataMap = (Map<String, Object>) coverageResult.convertToMap()
      .get('returnResultsData');

    System.debug(JSON.serialize(CCMDataMap));
    System.debug(JSON.serialize(payerDataMap));
    System.debug(JSON.serialize(insuredDataMap));
    System.debug(JSON.serialize(policyDataMap));

    Map<String, Object> data = (Map<String, Object>) policyDataMap.get(
      'returnResultsData'
    );
    System.debug(JSON.serialize(data));
  }
}