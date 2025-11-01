#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsDataTypeCompletion extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsDataTypeCompletion
     * @type {Guid}
     */
    static IID => Guid("{827d1a0e-0f73-11d2-b27a-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsCompleteMediaType"]

    /**
     * 
     * @param {HANDLE} FilterHandle 
     * @param {Integer} PinFactoryId 
     * @param {Pointer<AM_MEDIA_TYPE>} AmMediaType 
     * @returns {HRESULT} 
     */
    KsCompleteMediaType(FilterHandle, PinFactoryId, AmMediaType) {
        FilterHandle := FilterHandle is Win32Handle ? NumGet(FilterHandle, "ptr") : FilterHandle

        result := ComCall(3, this, "ptr", FilterHandle, "uint", PinFactoryId, "ptr", AmMediaType, "HRESULT")
        return result
    }
}
