#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\REG_VALUE_TYPE.ahk" { REG_VALUE_TYPE }

/**
 * Contains information about a registry value. The RegQueryMultipleValues function uses this structure. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winreg.h header defines VALENT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winreg/ns-winreg-valentw
 * @namespace Windows.Win32.System.Registry
 * @charset Unicode
 */
export default struct VALENTW {
    #StructPack 8

    /**
     * The name of the value to be retrieved. Be sure to set this member before calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regquerymultiplevaluesa">RegQueryMultipleValues</a>.
     */
    ve_valuename : PWSTR

    /**
     * The size of the data pointed to by <b>ve_valueptr</b>, in bytes.
     */
    ve_valuelen : UInt32

    /**
     * A pointer to the data for the value entry. This is a pointer to the value's data returned in the <b>lpValueBuf</b> buffer filled in by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regquerymultiplevaluesa">RegQueryMultipleValues</a>.
     */
    ve_valueptr : IntPtr

    /**
     * The type of data pointed to by <b>ve_valueptr</b>. For a list of the possible types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
     */
    ve_type : REG_VALUE_TYPE

}
