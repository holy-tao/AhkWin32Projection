#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Manages PlayReady-ND storage files.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstoragefilehelper
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDStorageFileHelper extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDStorageFileHelper
     * @type {Guid}
     */
    static IID => Guid("{d8f0bef8-91d2-4d47-a3f9-eaff4edb729f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileURLs"]

    /**
     * Gets transmitter settings from the URLs associated with a  object if the URLs contain PlayReady-ND metadata.
     * @param {IStorageFile} file_ A storage file object that a media server has discovered.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indstoragefilehelper.getfileurls
     */
    GetFileURLs(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &fileURLs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), fileURLs)
    }
}
