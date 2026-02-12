#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BackgroundTransferCompletionGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundUploader3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundUploader3
     * @type {Guid}
     */
    static IID => Guid("{b95e9439-5bf0-4b3a-8c47-2c6199a854b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CompletionGroup"]

    /**
     * @type {BackgroundTransferCompletionGroup} 
     */
    CompletionGroup {
        get => this.get_CompletionGroup()
    }

    /**
     * 
     * @returns {BackgroundTransferCompletionGroup} 
     */
    get_CompletionGroup() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTransferCompletionGroup(value)
    }
}
