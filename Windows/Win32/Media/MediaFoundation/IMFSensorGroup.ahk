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
     * 
     * @param {PWSTR} SymbolicLink 
     * @param {Integer} cchSymbolicLink 
     * @param {Pointer<Int32>} pcchWritten 
     * @returns {HRESULT} 
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink, pcchWritten) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(3, this, "ptr", SymbolicLink, "int", cchSymbolicLink, "int*", pcchWritten, "int")
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
        result := ComCall(4, this, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetSensorGroupAttributes(ppAttributes) {
        result := ComCall(5, this, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetSensorDeviceCount(pdwCount) {
        result := ComCall(6, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFSensorDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    GetSensorDevice(dwIndex, ppDevice) {
        result := ComCall(7, this, "uint", dwIndex, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     */
    SetDefaultSensorDeviceIndex(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwIndex 
     * @returns {HRESULT} 
     */
    GetDefaultSensorDeviceIndex(pdwIndex) {
        result := ComCall(9, this, "uint*", pdwIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaSource>} ppSource 
     * @returns {HRESULT} 
     */
    CreateMediaSource(ppSource) {
        result := ComCall(10, this, "ptr", ppSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
