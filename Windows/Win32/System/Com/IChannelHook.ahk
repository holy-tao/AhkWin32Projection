#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IChannelHook extends IUnknown{
    /**
     * The interface identifier for IChannelHook
     * @type {Guid}
     */
    static IID => Guid("{1008c4a0-7613-11cf-9af1-0020af6e72f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<UInt32>} pDataSize 
     * @returns {String} Nothing - always returns an empty string
     */
    ClientGetSize(uExtent, riid, pDataSize) {
        ComCall(3, this, "ptr", uExtent, "ptr", riid, "uint*", pDataSize)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<UInt32>} pDataSize 
     * @param {Pointer<Void>} pDataBuffer 
     * @returns {String} Nothing - always returns an empty string
     */
    ClientFillBuffer(uExtent, riid, pDataSize, pDataBuffer) {
        ComCall(4, this, "ptr", uExtent, "ptr", riid, "uint*", pDataSize, "ptr", pDataBuffer)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cbDataSize 
     * @param {Pointer<Void>} pDataBuffer 
     * @param {Integer} lDataRep 
     * @param {HRESULT} hrFault 
     * @returns {String} Nothing - always returns an empty string
     */
    ClientNotify(uExtent, riid, cbDataSize, pDataBuffer, lDataRep, hrFault) {
        ComCall(5, this, "ptr", uExtent, "ptr", riid, "uint", cbDataSize, "ptr", pDataBuffer, "uint", lDataRep, "int", hrFault)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cbDataSize 
     * @param {Pointer<Void>} pDataBuffer 
     * @param {Integer} lDataRep 
     * @returns {String} Nothing - always returns an empty string
     */
    ServerNotify(uExtent, riid, cbDataSize, pDataBuffer, lDataRep) {
        ComCall(6, this, "ptr", uExtent, "ptr", riid, "uint", cbDataSize, "ptr", pDataBuffer, "uint", lDataRep)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {HRESULT} hrFault 
     * @param {Pointer<UInt32>} pDataSize 
     * @returns {String} Nothing - always returns an empty string
     */
    ServerGetSize(uExtent, riid, hrFault, pDataSize) {
        ComCall(7, this, "ptr", uExtent, "ptr", riid, "int", hrFault, "uint*", pDataSize)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<UInt32>} pDataSize 
     * @param {Pointer<Void>} pDataBuffer 
     * @param {HRESULT} hrFault 
     * @returns {String} Nothing - always returns an empty string
     */
    ServerFillBuffer(uExtent, riid, pDataSize, pDataBuffer, hrFault) {
        ComCall(8, this, "ptr", uExtent, "ptr", riid, "uint*", pDataSize, "ptr", pDataBuffer, "int", hrFault)
        return result
    }
}
