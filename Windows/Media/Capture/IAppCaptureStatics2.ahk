#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureStatics2
     * @type {Guid}
     */
    static IID => Guid("{b2d881d4-836c-4da4-afd7-facc041e1cf3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllowedAsync"]

    /**
     * 
     * @param {Boolean} allowed 
     * @returns {IAsyncAction} 
     */
    SetAllowedAsync(allowed) {
        result := ComCall(6, this, "int", allowed, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
