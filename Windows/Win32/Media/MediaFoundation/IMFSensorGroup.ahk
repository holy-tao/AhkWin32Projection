#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk
#Include .\IMFSensorDevice.ahk
#Include .\IMFMediaSource.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a group of sensor devices from which an IMFMediaSource can be created.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensorgroup
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSensorGroup
     * @type {Guid}
     */
    static IID => Guid("{4110243a-9757-461f-89f1-f22345bcab4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSymbolicLink", "GetFlags", "GetSensorGroupAttributes", "GetSensorDeviceCount", "GetSensorDevice", "SetDefaultSensorDeviceIndex", "GetDefaultSensorDeviceIndex", "CreateMediaSource"]

    /**
     * 
     * @param {PWSTR} SymbolicLink 
     * @param {Integer} cchSymbolicLink 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(3, this, "ptr", SymbolicLink, "int", cchSymbolicLink, "int*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getflags
     */
    GetFlags() {
        result := ComCall(4, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsensorgroupattributes
     */
    GetSensorGroupAttributes() {
        result := ComCall(5, this, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevicecount
     */
    GetSensorDeviceCount() {
        result := ComCall(6, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {IMFSensorDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevice
     */
    GetSensorDevice(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &ppDevice := 0, "HRESULT")
        return IMFSensorDevice(ppDevice)
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-setdefaultsensordeviceindex
     */
    SetDefaultSensorDeviceIndex(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getdefaultsensordeviceindex
     */
    GetDefaultSensorDeviceIndex() {
        result := ComCall(9, this, "uint*", &pdwIndex := 0, "HRESULT")
        return pdwIndex
    }

    /**
     * 
     * @returns {IMFMediaSource} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-createmediasource
     */
    CreateMediaSource() {
        result := ComCall(10, this, "ptr*", &ppSource := 0, "HRESULT")
        return IMFMediaSource(ppSource)
    }
}
