#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IWwwFormUrlDecoderRuntimeClass extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWwwFormUrlDecoderRuntimeClass
     * @type {Guid}
     */
    static IID => Guid("{d45a0451-f225-4542-9296-0e1df5d254df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFirstValueByName"]

    /**
     * 
     * @param {HSTRING} name 
     * @returns {HSTRING} 
     */
    GetFirstValueByName(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        phstrValue := HSTRING()
        result := ComCall(6, this, "ptr", name, "ptr", phstrValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phstrValue
    }
}
