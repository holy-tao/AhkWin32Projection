#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pcchWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink, pcchWritten) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(3, this, "ptr", SymbolicLink, "int", cchSymbolicLink, "int*", pcchWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getflags
     */
    GetFlags(pFlags) {
        result := ComCall(4, this, "uint*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsensorgroupattributes
     */
    GetSensorGroupAttributes(ppAttributes) {
        result := ComCall(5, this, "ptr*", ppAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevicecount
     */
    GetSensorDeviceCount(pdwCount) {
        result := ComCall(6, this, "uint*", pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFSensorDevice>} ppDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevice
     */
    GetSensorDevice(dwIndex, ppDevice) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", ppDevice, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getdefaultsensordeviceindex
     */
    GetDefaultSensorDeviceIndex(pdwIndex) {
        result := ComCall(9, this, "uint*", pdwIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaSource>} ppSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-createmediasource
     */
    CreateMediaSource(ppSource) {
        result := ComCall(10, this, "ptr*", ppSource, "HRESULT")
        return result
    }
}
