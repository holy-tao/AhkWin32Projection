#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Core
 * @version WindowsRuntime 1.4
 */
class IVariablePhotoSequenceCapture2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVariablePhotoSequenceCapture2
     * @type {Guid}
     */
    static IID => Guid("{fe2c62bc-50b0-43e3-917c-e3b92798942f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateSettingsAsync"]

    /**
     * 
     * @returns {IAsyncAction} 
     */
    UpdateSettingsAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
