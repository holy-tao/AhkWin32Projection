#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IKsPin.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsPinEx extends IKsPin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsPinEx
     * @type {Guid}
     */
    static IID => Guid("{7bb38260-d19c-11d2-b38a-00a0c95ec22e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsNotifyError"]

    /**
     * 
     * @param {IMediaSample} Sample 
     * @param {HRESULT} hr 
     * @returns {String} Nothing - always returns an empty string
     */
    KsNotifyError(Sample, hr) {
        ComCall(16, this, "ptr", Sample, "int", hr)
    }
}
