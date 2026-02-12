#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BackgroundUploader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundUploaderFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundUploaderFactory
     * @type {Guid}
     */
    static IID => Guid("{736203c7-10e7-48a0-ac3c-1ac71095ec57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithCompletionGroup"]

    /**
     * 
     * @param {BackgroundTransferCompletionGroup} completionGroup 
     * @returns {BackgroundUploader} 
     */
    CreateWithCompletionGroup(completionGroup) {
        result := ComCall(6, this, "ptr", completionGroup, "ptr*", &backgroundUploader_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundUploader(backgroundUploader_)
    }
}
