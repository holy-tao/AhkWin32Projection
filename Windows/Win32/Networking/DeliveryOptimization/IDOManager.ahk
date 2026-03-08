#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDODownload.ahk
#Include ..\..\System\Com\IEnumUnknown.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to create a new download, and to enumerate existing downloads.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nn-deliveryoptimization-idomanager
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class IDOManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOManager
     * @type {Guid}
     */
    static IID => Guid("{400e2d4a-1431-4c1a-a748-39ca472cfdb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDownload", "EnumDownloads"]

    /**
     * Creates a new download.
     * @returns {IDODownload} The address of an **IDODownload** interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idomanager-createdownload
     */
    CreateDownload() {
        result := ComCall(3, this, "ptr*", &download := 0, "HRESULT")
        return IDODownload(download)
    }

    /**
     * Retrieves an interface pointer to an enumerator object that is used to enumerate existing downloads.
     * @param {Pointer<DO_DOWNLOAD_ENUM_CATEGORY>} category Optional. The property name to be used as a category to enumerate. Passing `nullptr` will retrieve all existing downloads. The following properties are supported as a category.
     * 
     * - **DODownloadProperty_Id**
     * - **DODownloadProperty_Uri**
     * - **DODownloadProperty_ContentId**
     * - **DODownloadProperty_DisplayName**
     * - **DODownloadProperty_LocalPath**
     * @returns {IEnumUnknown} The address of an interface pointer to **IEnumUnknown**, which is used to enumerate existing downloads. The contents of the enumerator depend on the value of *category*. The downloads included in the enumeration interface are the ones that were previously created by the same caller to this function.
     * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/nf-deliveryoptimization-idomanager-enumdownloads
     */
    EnumDownloads(category) {
        result := ComCall(4, this, "ptr", category, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumUnknown(ppEnum)
    }
}
