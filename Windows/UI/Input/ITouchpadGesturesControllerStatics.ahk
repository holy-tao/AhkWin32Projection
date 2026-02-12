#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TouchpadGesturesController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class ITouchpadGesturesControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITouchpadGesturesControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{207ef171-1a73-51cd-a694-8840e09dbafa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSupported", "CreateForProcess"]

    /**
     * 
     * @returns {Boolean} 
     */
    IsSupported() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {TouchpadGesturesController} 
     */
    CreateForProcess() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TouchpadGesturesController(result_)
    }
}
