#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesItem.ahk

/**
 * Represents a directory item in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesdirectoryitem
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesDirectoryItem extends IOfflineFilesItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesDirectoryItem
     * @type {Guid}
     */
    static IID => Guid("{2273597a-a08c-4a00-a37a-c1ae4e9a1cfd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
