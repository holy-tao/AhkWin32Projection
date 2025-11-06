#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a sensor device that can belong to a sensor group, which is represented by the IMFSensorGroup interface. The term &quot;device&quot; in this context could refer to a physical device, a custom media source, or a frame provider.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensordevice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSensorDevice
     * @type {Guid}
     */
    static IID => Guid("{fb9f48f2-2a18-4e28-9730-786f30f04dc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceId", "GetDeviceType", "GetFlags", "GetSymbolicLink", "GetDeviceAttributes", "GetStreamAttributesCount", "GetStreamAttributes", "SetSensorDeviceMode", "GetSensorDeviceMode"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getdeviceid
     */
    GetDeviceId() {
        result := ComCall(3, this, "uint*", &pDeviceId := 0, "HRESULT")
        return pDeviceId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getdevicetype
     */
    GetDeviceType() {
        result := ComCall(4, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getflags
     */
    GetFlags() {
        result := ComCall(5, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * 
     * @param {PWSTR} SymbolicLink 
     * @param {Integer} cchSymbolicLink 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(6, this, "ptr", SymbolicLink, "int", cchSymbolicLink, "int*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getdeviceattributes
     */
    GetDeviceAttributes() {
        result := ComCall(7, this, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * 
     * @param {Integer} eType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getstreamattributescount
     */
    GetStreamAttributesCount(eType) {
        result := ComCall(8, this, "int", eType, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {Integer} eType 
     * @param {Integer} dwIndex 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getstreamattributes
     */
    GetStreamAttributes(eType, dwIndex) {
        result := ComCall(9, this, "int", eType, "uint", dwIndex, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * 
     * @param {Integer} eMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-setsensordevicemode
     */
    SetSensorDeviceMode(eMode) {
        result := ComCall(10, this, "int", eMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getsensordevicemode
     */
    GetSensorDeviceMode() {
        result := ComCall(11, this, "int*", &peMode := 0, "HRESULT")
        return peMode
    }
}
