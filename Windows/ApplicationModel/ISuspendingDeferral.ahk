#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Manages a delayed app suspending operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.isuspendingdeferral
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class ISuspendingDeferral extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISuspendingDeferral
     * @type {Guid}
     */
    static IID => Guid("{59140509-8bc9-4eb4-b636-dabdc4f46f66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Complete"]

    /**
     * Notifies the system that the app has saved its data and is ready to be suspended.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/isuspendingdeferral-complete
     */
    Complete() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
