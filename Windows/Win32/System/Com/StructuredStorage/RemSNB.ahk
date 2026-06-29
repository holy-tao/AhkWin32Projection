#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The RemSNB structure is used for marshaling the SNB data type.Defined in the IStorage interface (Storag.idl).
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-remsnb
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct RemSNB {
    #StructPack 4

    /**
     * Number of strings in the <b>rgString</b> buffer.
     */
    ulCntStr : UInt32

    /**
     * Size in bytes of the <b>rgString</b> buffer.
     */
    ulCntChar : UInt32

    /**
     * Pointer to an array of bytes containing the stream name strings from the <b>SNB</b> structure.
     */
    rgString : WCHAR[1]

}
