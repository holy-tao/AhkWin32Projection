#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SWbemQueryQualifiedName structure stores property names for the IWbemQuery::GetAnalysis method.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/ns-wmiutils-swbemqueryqualifiedname
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class SWbemQueryQualifiedName extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Unused. Always 1 (one).
     * @type {Integer}
     */
    m_uVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Unused. Always 1 (one).
     * @type {Integer}
     */
    m_uTokenType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of elements in the list of names. For example, for the  "propName" property,  <b>m_uNameListSize</b> is 1 (one) and <b>m_ppszNameList</b> is "propName".
     * @type {Integer}
     */
    m_uNameListSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * List of property names. For example, for the  "propName" property, <b>m_uNameListSize</b> is 1 (one) and <b>m_ppszNameList</b> is "propName".
     * @type {Pointer<PWSTR>}
     */
    m_ppszNameList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Unused. Always <b>false</b>.
     * @type {BOOL}
     */
    m_bArraysUsed {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Unused. Always <b>NULL</b>.
     * @type {Pointer<BOOL>}
     */
    m_pbArrayElUsed {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Unused. Always <b>NULL</b>.
     * @type {Pointer<Integer>}
     */
    m_puArrayIndex {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
