#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates the device capabilities defined in the package manifest.
 * @remarks
 * Device capabilities are specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-devicecapability">DeviceCapability</a> element in the package manifest.
 * 
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getdevicecapabilities">IAppxManifestReader::GetDeviceCapabilities</a> method.
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxmanifestdevicecapabilitiesenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestDeviceCapabilitiesEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestDeviceCapabilitiesEnumerator
     * @type {Guid}
     */
    static IID => Guid("{30204541-427b-4a1c-bacf-655bf463a540}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrent", "GetHasCurrent", "MoveNext"]

    /**
     * Gets the device capability at the current position of the enumerator.
     * @remarks
     * The caller must free the memory allocated for <i>deviceCapability</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * 
     * The enumerator returned can be empty. In this case, a call to  <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestdevicecapabilitiesenumerator-gethascurrent">GetHasCurrent</a> returns <b>false</b>. If the enumerator is not empty, it points to the first element, and this method returns the first item. Subsequently, the user should use <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestdevicecapabilitiesenumerator-movenext">MoveNext</a> to move through the items, and call <b>GetHasCurrent</b> before using <b>GetCurrent</b> to access the item.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The current device capability.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxmanifestdevicecapabilitiesenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(3, this, "ptr*", &deviceCapability := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceCapability
    }

    /**
     * Determines whether there is a device capability at the current position of the enumerator.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the enumerator's current position references an item; <b>FALSE</b> if the enumerator has passed the last item in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxmanifestdevicecapabilitiesenumerator-gethascurrent
     */
    GetHasCurrent() {
        result := ComCall(4, this, "int*", &hasCurrent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hasCurrent
    }

    /**
     * Advances the position of the enumerator to the next device capability.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the enumerator successfully advances
     * 
     * <b>FALSE</b> if the enumerator has passed the end of the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxmanifestdevicecapabilitiesenumerator-movenext
     */
    MoveNext() {
        result := ComCall(5, this, "int*", &hasNext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hasNext
    }
}
