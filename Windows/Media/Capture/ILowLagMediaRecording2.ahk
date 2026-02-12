#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ILowLagMediaRecording2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLagMediaRecording2
     * @type {Guid}
     */
    static IID => Guid("{6369c758-5644-41e2-97af-8ef56a25e225}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PauseAsync", "ResumeAsync"]

    /**
     * 
     * @param {Integer} behavior 
     * @returns {IAsyncAction} 
     */
    PauseAsync(behavior) {
        result := ComCall(6, this, "int", behavior, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ResumeAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
