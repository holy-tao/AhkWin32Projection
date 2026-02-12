#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MediaComposition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaCompositionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCompositionStatics
     * @type {Guid}
     */
    static IID => Guid("{87a08f04-e32a-45ce-8f66-a30df0766224}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadAsync"]

    /**
     * 
     * @param {StorageFile} file_ 
     * @returns {IAsyncOperation<MediaComposition>} 
     */
    LoadAsync(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaComposition, operation)
    }
}
