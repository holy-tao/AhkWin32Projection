#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ISocketErrorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocketErrorStatics
     * @type {Guid}
     */
    static IID => Guid("{828337f4-7d56-4d8e-b7b4-a07dd7c1bca9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus"]

    /**
     * 
     * @param {Integer} hresult_ 
     * @returns {Integer} 
     */
    GetStatus(hresult_) {
        result := ComCall(6, this, "int", hresult_, "int*", &status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status_
    }
}
