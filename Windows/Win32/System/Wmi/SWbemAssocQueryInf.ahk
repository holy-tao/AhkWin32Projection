#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {IWbemPath}
     */
    m_pPath {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * String representation of the object path used in the query.
     * @type {PWSTR}
     */
    m_pszPath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Text of the original query.
     * @type {PWSTR}
     */
    m_pszQueryText {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * String representation of the result class. If there is no result class, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszResultClass {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * String representation of the association class. If there is no result class, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszAssocClass {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * String representation of the role. If there is no role, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszRole {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * String representation of the result role. If there is no result role, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszResultRole {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * String representation of the required qualifier. If no qualifiers are required, this field is <b>NULL</b>.
     * @type {PWSTR}
     */
    m_pszRequiredQualifier {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to a list of required association qualifiers.
     * @type {PWSTR}
     */
    m_pszRequiredAssocQualifier {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
