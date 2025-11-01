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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAutoIndexing", "GetAutoIndexing", "SetControlStream", "GetMode", "OnDataUnitEx", "SetUnbufferedIO", "GetUnbufferedIO", "CompleteOperations"]

    /**
     * 
     * @param {BOOL} fDoAutoIndexing 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setautoindexing
     */
    SetAutoIndexing(fDoAutoIndexing) {
        result := ComCall(16, this, "int", fDoAutoIndexing, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAutoIndexing 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-getautoindexing
     */
    GetAutoIndexing(pfAutoIndexing) {
        result := ComCall(17, this, "ptr", pfAutoIndexing, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {BOOL} fShouldControlStartAndStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setcontrolstream
     */
    SetControlStream(wStreamNumber, fShouldControlStartAndStop) {
        result := ComCall(18, this, "ushort", wStreamNumber, "int", fShouldControlStartAndStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFileSinkMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-getmode
     */
    GetMode(pdwFileSinkMode) {
        result := ComCall(19, this, "uint*", pdwFileSinkMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WMT_FILESINK_DATA_UNIT>} pFileSinkDataUnit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-ondataunitex
     */
    OnDataUnitEx(pFileSinkDataUnit) {
        result := ComCall(20, this, "ptr", pFileSinkDataUnit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fUnbufferedIO 
     * @param {BOOL} fRestrictMemUsage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-setunbufferedio
     */
    SetUnbufferedIO(fUnbufferedIO, fRestrictMemUsage) {
        result := ComCall(21, this, "int", fUnbufferedIO, "int", fRestrictMemUsage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfUnbufferedIO 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-getunbufferedio
     */
    GetUnbufferedIO(pfUnbufferedIO) {
        result := ComCall(22, this, "ptr", pfUnbufferedIO, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterfilesink3-completeoperations
     */
    CompleteOperations() {
        result := ComCall(23, this, "HRESULT")
        return result
    }
}
