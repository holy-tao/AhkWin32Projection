#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterFileSink2.ahk

/**
 * The IWMWriterFileSink3 interface provides additional functionality to the file sink object. To obtain a pointer to this interface, call QueryInterface on the file sink object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriterfilesink3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterFileSink3 extends IWMWriterFileSink2{
    /**
     * The interface identifier for IWMWriterFileSink3
     * @type {Guid}
     */
    static IID => Guid("{3fea4feb-2945-47a7-a1dd-c53a8fc4c45c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * 
     * @param {BOOL} fDoAutoIndexing 
     * @returns {HRESULT} 
     */
    SetAutoIndexing(fDoAutoIndexing) {
        result := ComCall(16, this, "int", fDoAutoIndexing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAutoIndexing 
     * @returns {HRESULT} 
     */
    GetAutoIndexing(pfAutoIndexing) {
        result := ComCall(17, this, "ptr", pfAutoIndexing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {BOOL} fShouldControlStartAndStop 
     * @returns {HRESULT} 
     */
    SetControlStream(wStreamNumber, fShouldControlStartAndStop) {
        result := ComCall(18, this, "ushort", wStreamNumber, "int", fShouldControlStartAndStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFileSinkMode 
     * @returns {HRESULT} 
     */
    GetMode(pdwFileSinkMode) {
        result := ComCall(19, this, "uint*", pdwFileSinkMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WMT_FILESINK_DATA_UNIT>} pFileSinkDataUnit 
     * @returns {HRESULT} 
     */
    OnDataUnitEx(pFileSinkDataUnit) {
        result := ComCall(20, this, "ptr", pFileSinkDataUnit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fUnbufferedIO 
     * @param {BOOL} fRestrictMemUsage 
     * @returns {HRESULT} 
     */
    SetUnbufferedIO(fUnbufferedIO, fRestrictMemUsage) {
        result := ComCall(21, this, "int", fUnbufferedIO, "int", fRestrictMemUsage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfUnbufferedIO 
     * @returns {HRESULT} 
     */
    GetUnbufferedIO(pfUnbufferedIO) {
        result := ComCall(22, this, "ptr", pfUnbufferedIO, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteOperations() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
