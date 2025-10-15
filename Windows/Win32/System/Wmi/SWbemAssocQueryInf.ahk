#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information from the IWbemQuery::GetAnalysis method when you use the WMIQ_ANALYSIS_ASSOC_QUERY analysis type.
 * @see https://docs.microsoft.com/windows/win32/api//wmiutils/ns-wmiutils-swbemassocqueryinf
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class SWbemAssocQueryInf extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Value must be 2.
     * @type {Integer}
     */
    m_uVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Value must be 2.
     * @type {Integer}
     */
    m_uAnalysisType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Bit values that indicate the features in a query.
     * @type {Integer}
     */
    m_uFeatureMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmiutils/nn-wmiutils-iwbempath">IWbemPath</a> object.
     * @type {Pointer<IWbemPath>}
     */
    m_pPath {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * String representation of the object path used in the query.
     * @type {PWSTR}
     */
    m_pszPath{
        get {
            if(!this.HasProp("__m_pszPath"))
                this.__m_pszPath := PWSTR(this.ptr + 24)
            return this.__m_pszPath
        }
    }

    /**
     * Text of the original query.
     * @type {PWSTR}
     */
    m_pszQueryText{
        get {
            if(!this.HasProp("__m_pszQueryText"))
                this.__m_pszQueryText := PWSTR(this.ptr + 32)
            return this.__m_pszQueryText
        }
    }

    /**
     * String representation of the result class. If there is no result class, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszResultClass{
        get {
            if(!this.HasProp("__m_pszResultClass"))
                this.__m_pszResultClass := PWSTR(this.ptr + 40)
            return this.__m_pszResultClass
        }
    }

    /**
     * String representation of the association class. If there is no result class, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszAssocClass{
        get {
            if(!this.HasProp("__m_pszAssocClass"))
                this.__m_pszAssocClass := PWSTR(this.ptr + 48)
            return this.__m_pszAssocClass
        }
    }

    /**
     * String representation of the role. If there is no role, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszRole{
        get {
            if(!this.HasProp("__m_pszRole"))
                this.__m_pszRole := PWSTR(this.ptr + 56)
            return this.__m_pszRole
        }
    }

    /**
     * String representation of the result role. If there is no result role, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszResultRole{
        get {
            if(!this.HasProp("__m_pszResultRole"))
                this.__m_pszResultRole := PWSTR(this.ptr + 64)
            return this.__m_pszResultRole
        }
    }

    /**
     * String representation of the required qualifier. If no qualifiers are required, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszRequiredQualifier{
        get {
            if(!this.HasProp("__m_pszRequiredQualifier"))
                this.__m_pszRequiredQualifier := PWSTR(this.ptr + 72)
            return this.__m_pszRequiredQualifier
        }
    }

    /**
     * Pointer to a list of required association qualifiers.
     * @type {PWSTR}
     */
    m_pszRequiredAssocQualifier{
        get {
            if(!this.HasProp("__m_pszRequiredAssocQualifier"))
                this.__m_pszRequiredAssocQualifier := PWSTR(this.ptr + 80)
            return this.__m_pszRequiredAssocQualifier
        }
    }
}
