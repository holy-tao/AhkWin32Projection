#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCHEMACONTENTTYPE.ahk" { SCHEMACONTENTTYPE }
#Import ".\SXH_PROXY_SETTING.ahk" { SXH_PROXY_SETTING }
#Import ".\SXH_SERVER_CERT_OPTION.ahk" { SXH_SERVER_CERT_OPTION }
#Import ".\SCHEMAPROCESSCONTENTS.ahk" { SCHEMAPROCESSCONTENTS }
#Import ".\SCHEMAWHITESPACE.ahk" { SCHEMAWHITESPACE }
#Import ".\SOMITEMTYPE.ahk" { SOMITEMTYPE }
#Import ".\SCHEMATYPEVARIETY.ahk" { SCHEMATYPEVARIETY }
#Import ".\SCHEMAUSE.ahk" { SCHEMAUSE }
#Import ".\SCHEMADERIVATIONMETHOD.ahk" { SCHEMADERIVATIONMETHOD }
#Import ".\SERVERXMLHTTP_OPTION.ahk" { SERVERXMLHTTP_OPTION }
#Import ".\DOMNodeType.ahk" { DOMNodeType }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct __msxml6_ReferenceRemainingTypes__ {
    #StructPack 4

    __tagDomNodeType__ : DOMNodeType

    __domNodeType__ : DOMNodeType

    __serverXmlHttpOptionEnum__ : SERVERXMLHTTP_OPTION

    __serverXmlHttpOption__ : SERVERXMLHTTP_OPTION

    __serverCertOptionEnum__ : SXH_SERVER_CERT_OPTION

    __serverCertOption__ : SXH_SERVER_CERT_OPTION

    __proxySettingEnum__ : SXH_PROXY_SETTING

    __proxySetting__ : SXH_PROXY_SETTING

    __somItemTypeEnum__ : SOMITEMTYPE

    __somItemType__ : SOMITEMTYPE

    __schemaUseEnum__ : SCHEMAUSE

    __schemaUse__ : SCHEMAUSE

    __schemaDerivationMethodEnum__ : SCHEMADERIVATIONMETHOD

    __schemaDerivationMethod__ : SCHEMADERIVATIONMETHOD

    __schemaContentTypeEnum__ : SCHEMACONTENTTYPE

    __schemaContentType__ : SCHEMACONTENTTYPE

    __schemaProcessContentsEnum__ : SCHEMAPROCESSCONTENTS

    __schemaProcessContents__ : SCHEMAPROCESSCONTENTS

    __schemaWhitespaceEnum__ : SCHEMAWHITESPACE

    __schemaWhitespace__ : SCHEMAWHITESPACE

    __schemaTypeVarietyEnum__ : SCHEMATYPEVARIETY

    __schemaTypeVariety__ : SCHEMATYPEVARIETY

}
