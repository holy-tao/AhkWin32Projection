#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStatusCallback.ahk

/**
 * The IWMReaderCallback is implemented by the application to handle data being read from a file. A pointer to the interface is passed to IWMReader::Open.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreadercallback
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderCallback extends IWMStatusCallback{
    /**
     * The interface identifier for IWMReaderCallback
     * @type {Guid}
     */
    static IID => Guid("{96406bd8-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} cnsSampleDuration 
     * @param {Integer} dwFlags 
     * @param {Pointer<INSSBuffer>} pSample 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    OnSample(dwOutputNum, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext) {
        result := ComCall(4, this, "uint", dwOutputNum, "uint", cnsSampleTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
