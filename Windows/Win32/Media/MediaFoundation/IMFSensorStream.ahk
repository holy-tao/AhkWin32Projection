#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensorstream
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorStream extends IMFAttributes{
    /**
     * The interface identifier for IMFSensorStream
     * @type {Guid}
     */
    static IID => Guid("{e9a42171-c56e-498a-8b39-eda5a070b7fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetMediaTypeCount(pdwCount) {
        result := ComCall(33, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetMediaType(dwIndex, ppMediaType) {
        result := ComCall(34, this, "uint", dwIndex, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFSensorStream>} ppStream 
     * @returns {HRESULT} 
     */
    CloneSensorStream(ppStream) {
        result := ComCall(35, this, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
