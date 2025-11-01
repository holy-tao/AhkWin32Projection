#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesItem.ahk

/**
 * Represents a server item in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesserveritem
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesServerItem extends IOfflineFilesItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesServerItem
     * @type {Guid}
     */
    static IID => Guid("{9b1c9576-a92b-4151-8e9e-7c7b3ec2e016}")

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
