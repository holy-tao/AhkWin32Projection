#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about an activated event that fires after the app was suspended for a file open picker operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifileopenpickercontinuationeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IFileOpenPickerContinuationEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOpenPickerContinuationEventArgs
     * @type {Guid}
     */
    static IID => Guid("{f0fa3f3a-d4e8-4ad3-9c34-2308f32fcec9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Files"]

    /**
     * Gets the list of files selected by the user during the file open picker operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ifileopenpickercontinuationeventargs.files
     * @type {IVectorView<StorageFile>} 
     */
    Files {
        get => this.get_Files()
    }

    /**
     * 
     * @returns {IVectorView<StorageFile>} 
     */
    get_Files() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(StorageFile, value)
    }
}
