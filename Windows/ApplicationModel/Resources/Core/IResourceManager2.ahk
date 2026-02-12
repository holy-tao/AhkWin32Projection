#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\NamedResource.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ResourceMap.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceManager2
     * @type {Guid}
     */
    static IID => Guid("{9d66fe6c-a4d7-4c23-9e85-675f304c252d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAllNamedResourcesForPackage", "GetAllSubtreesForPackage"]

    /**
     * 
     * @param {HSTRING} packageName 
     * @param {ResourceLayoutInfo} resourceLayoutInfo_ 
     * @returns {IVectorView<NamedResource>} 
     */
    GetAllNamedResourcesForPackage(packageName, resourceLayoutInfo_) {
        if(packageName is String) {
            pin := HSTRING.Create(packageName)
            packageName := pin.Value
        }
        packageName := packageName is Win32Handle ? NumGet(packageName, "ptr") : packageName

        result := ComCall(6, this, "ptr", packageName, "ptr", resourceLayoutInfo_, "ptr*", &table := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(NamedResource, table)
    }

    /**
     * 
     * @param {HSTRING} packageName 
     * @param {ResourceLayoutInfo} resourceLayoutInfo_ 
     * @returns {IVectorView<ResourceMap>} 
     */
    GetAllSubtreesForPackage(packageName, resourceLayoutInfo_) {
        if(packageName is String) {
            pin := HSTRING.Create(packageName)
            packageName := pin.Value
        }
        packageName := packageName is Win32Handle ? NumGet(packageName, "ptr") : packageName

        result := ComCall(7, this, "ptr", packageName, "ptr", resourceLayoutInfo_, "ptr*", &table := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ResourceMap, table)
    }
}
