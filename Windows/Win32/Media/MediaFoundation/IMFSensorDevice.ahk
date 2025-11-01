#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getdeviceid
     */
    GetDeviceId(pDeviceId) {
        pDeviceIdMarshal := pDeviceId is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pDeviceIdMarshal, pDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getdevicetype
     */
    GetDeviceType(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getflags
     */
    GetFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} SymbolicLink 
     * @param {Integer} cchSymbolicLink 
     * @param {Pointer<Integer>} pcchWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink, pcchWritten) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        pcchWrittenMarshal := pcchWritten is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", SymbolicLink, "int", cchSymbolicLink, pcchWrittenMarshal, pcchWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getdeviceattributes
     */
    GetDeviceAttributes(ppAttributes) {
        result := ComCall(7, this, "ptr*", ppAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eType 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getstreamattributescount
     */
    GetStreamAttributesCount(eType, pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "int", eType, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eType 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getstreamattributes
     */
    GetStreamAttributes(eType, dwIndex, ppAttributes) {
        result := ComCall(9, this, "int", eType, "uint", dwIndex, "ptr*", ppAttributes, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} peMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensordevice-getsensordevicemode
     */
    GetSensorDeviceMode(peMode) {
        peModeMarshal := peMode is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, peModeMarshal, peMode, "HRESULT")
        return result
    }
}
