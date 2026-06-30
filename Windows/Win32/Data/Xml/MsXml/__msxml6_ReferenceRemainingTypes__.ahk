#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DOMNodeType.ahk
#Include .\SERVERXMLHTTP_OPTION.ahk
#Include .\SCHEMAPROCESSCONTENTS.ahk
#Include .\SCHEMAWHITESPACE.ahk
#Include .\SCHEMAUSE.ahk
#Include .\SCHEMADERIVATIONMETHOD.ahk
#Include .\SCHEMACONTENTTYPE.ahk
#Include .\SCHEMATYPEVARIETY.ahk
#Include .\SXH_PROXY_SETTING.ahk
#Include .\SXH_SERVER_CERT_OPTION.ahk
#Include .\SOMITEMTYPE.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class __msxml6_ReferenceRemainingTypes__ extends Win32Struct {
    static sizeof => 88

    static packingSize => 4

    /**
     * @type {DOMNodeType}
     */
    __tagDomNodeType__ {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {DOMNodeType}
     */
    __domNodeType__ {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {SERVERXMLHTTP_OPTION}
     */
    __serverXmlHttpOptionEnum__ {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {SERVERXMLHTTP_OPTION}
     */
    __serverXmlHttpOption__ {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {SXH_SERVER_CERT_OPTION}
     */
    __serverCertOptionEnum__ {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {SXH_SERVER_CERT_OPTION}
     */
    __serverCertOption__ {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {SXH_PROXY_SETTING}
     */
    __proxySettingEnum__ {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {SXH_PROXY_SETTING}
     */
    __proxySetting__ {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {SOMITEMTYPE}
     */
    __somItemTypeEnum__ {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {SOMITEMTYPE}
     */
    __somItemType__ {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {SCHEMAUSE}
     */
    __schemaUseEnum__ {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {SCHEMAUSE}
     */
    __schemaUse__ {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {SCHEMADERIVATIONMETHOD}
     */
    __schemaDerivationMethodEnum__ {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {SCHEMADERIVATIONMETHOD}
     */
    __schemaDerivationMethod__ {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {SCHEMACONTENTTYPE}
     */
    __schemaContentTypeEnum__ {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {SCHEMACONTENTTYPE}
     */
    __schemaContentType__ {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {SCHEMAPROCESSCONTENTS}
     */
    __schemaProcessContentsEnum__ {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {SCHEMAPROCESSCONTENTS}
     */
    __schemaProcessContents__ {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {SCHEMAWHITESPACE}
     */
    __schemaWhitespaceEnum__ {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {SCHEMAWHITESPACE}
     */
    __schemaWhitespace__ {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {SCHEMATYPEVARIETY}
     */
    __schemaTypeVarietyEnum__ {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {SCHEMATYPEVARIETY}
     */
    __schemaTypeVariety__ {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }
}
