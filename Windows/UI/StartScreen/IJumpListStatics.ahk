#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\JumpList.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class IJumpListStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJumpListStatics
     * @type {Guid}
     */
    static IID => Guid("{a7e0c681-e67e-4b74-8250-3f322c4d92c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadCurrentAsync", "IsSupported"]

    /**
     * 
     * @returns {IAsyncOperation<JumpList>} 
     */
    LoadCurrentAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(JumpList, result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsSupported() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
