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
     * 
     * @param {Pointer<UInt64>} pDeviceId 
     * @returns {HRESULT} 
     */
    GetDeviceId(pDeviceId) {
        result := ComCall(3, this, "uint*", pDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetDeviceType(pType) {
        result := ComCall(4, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pFlags) {
        result := ComCall(5, this, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} SymbolicLink 
     * @param {Integer} cchSymbolicLink 
     * @param {Pointer<Int32>} pcchWritten 
     * @returns {HRESULT} 
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink, pcchWritten) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(6, this, "ptr", SymbolicLink, "int", cchSymbolicLink, "int*", pcchWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetDeviceAttributes(ppAttributes) {
        result := ComCall(7, this, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eType 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetStreamAttributesCount(eType, pdwCount) {
        result := ComCall(8, this, "int", eType, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eType 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetStreamAttributes(eType, dwIndex, ppAttributes) {
        result := ComCall(9, this, "int", eType, "uint", dwIndex, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eMode 
     * @returns {HRESULT} 
     */
    SetSensorDeviceMode(eMode) {
        result := ComCall(10, this, "int", eMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peMode 
     * @returns {HRESULT} 
     */
    GetSensorDeviceMode(peMode) {
        result := ComCall(11, this, "int*", peMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
