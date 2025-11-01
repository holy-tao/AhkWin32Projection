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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSample"]

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} cnsSampleDuration 
     * @param {Integer} dwFlags 
     * @param {INSSBuffer} pSample 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadercallback-onsample
     */
    OnSample(dwOutputNum, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwOutputNum, "uint", cnsSampleTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, pvContextMarshal, pvContext, "HRESULT")
        return result
    }
}
