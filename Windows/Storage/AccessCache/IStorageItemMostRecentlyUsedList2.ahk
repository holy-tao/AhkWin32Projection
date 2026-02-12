#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class IStorageItemMostRecentlyUsedList2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemMostRecentlyUsedList2
     * @type {Guid}
     */
    static IID => Guid("{da481ea0-ed8d-4731-a1db-e44ee2204093}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddWithMetadataAndVisibility", "AddOrReplaceWithMetadataAndVisibility"]

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {IStorageItem} file_ 
     * @param {HSTRING} metadata 
     * @param {Integer} visibility_ 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    AddWithMetadataAndVisibility(file_, metadata, visibility_) {
        if(metadata is String) {
            pin := HSTRING.Create(metadata)
            metadata := pin.Value
        }
        metadata := metadata is Win32Handle ? NumGet(metadata, "ptr") : metadata

        token := HSTRING()
        result := ComCall(6, this, "ptr", file_, "ptr", metadata, "int", visibility_, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {HSTRING} token 
     * @param {IStorageItem} file_ 
     * @param {HSTRING} metadata 
     * @param {Integer} visibility_ 
     * @returns {HRESULT} 
     */
    AddOrReplaceWithMetadataAndVisibility(token, file_, metadata, visibility_) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token
        if(metadata is String) {
            pin := HSTRING.Create(metadata)
            metadata := pin.Value
        }
        metadata := metadata is Win32Handle ? NumGet(metadata, "ptr") : metadata

        result := ComCall(7, this, "ptr", token, "ptr", file_, "ptr", metadata, "int", visibility_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
