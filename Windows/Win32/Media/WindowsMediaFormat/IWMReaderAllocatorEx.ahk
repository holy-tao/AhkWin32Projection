#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderAllocatorEx interface provides expanded alternatives to the AllocateForOutput and AllocateForStream methods of the IWMReaderCallbackAdvanced interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAllocatorEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAllocatorEx
     * @type {Guid}
     */
    static IID => Guid("{9f762fa7-a22e-428d-93c9-ac82f3aafe5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllocateForStreamEx", "AllocateForOutputEx"]

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} cbBuffer 
     * @param {Pointer<INSSBuffer>} ppBuffer 
     * @param {Integer} dwFlags 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} cnsSampleDuration 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderallocatorex-allocateforstreamex
     */
    AllocateForStreamEx(wStreamNum, cbBuffer, ppBuffer, dwFlags, cnsSampleTime, cnsSampleDuration, pvContext) {
        result := ComCall(3, this, "ushort", wStreamNum, "uint", cbBuffer, "ptr*", ppBuffer, "uint", dwFlags, "uint", cnsSampleTime, "uint", cnsSampleDuration, "ptr", pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} cbBuffer 
     * @param {Pointer<INSSBuffer>} ppBuffer 
     * @param {Integer} dwFlags 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} cnsSampleDuration 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderallocatorex-allocateforoutputex
     */
    AllocateForOutputEx(dwOutputNum, cbBuffer, ppBuffer, dwFlags, cnsSampleTime, cnsSampleDuration, pvContext) {
        result := ComCall(4, this, "uint", dwOutputNum, "uint", cbBuffer, "ptr*", ppBuffer, "uint", dwFlags, "uint", cnsSampleTime, "uint", cnsSampleDuration, "ptr", pvContext, "HRESULT")
        return result
    }
}
