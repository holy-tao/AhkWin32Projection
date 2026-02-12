#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the marshaling type for the class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.marshalingtype
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class MarshalingType extends Win32Enum{

    /**
     * The class prevents marshaling on all interfaces.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * The class marshals and unmarshals to the same pointer value on all interfaces.
     * @type {Integer (Int32)}
     */
    static Agile => 2

    /**
     * The class does not implement [IMarshal](/windows/desktop/api/objidl/nn-objidl-imarshal) or forwards to [CoGetStandardMarshal](/windows/desktop/api/combaseapi/nf-combaseapi-cogetstandardmarshal) on all interfaces.
     * @type {Integer (Int32)}
     */
    static Standard => 3

    /**
     * The class can't be marshaled.
     * @type {Integer (Int32)}
     */
    static InvalidMarshaling => 0
}
