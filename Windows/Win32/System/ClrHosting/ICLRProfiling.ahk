#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRProfiling extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRProfiling
     * @type {Guid}
     */
    static IID => Guid("{b349abe3-b56f-4689-bfcd-76bf39d888ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachProfiler"]

    /**
     * 
     * @param {Integer} dwProfileeProcessID 
     * @param {Integer} dwMillisecondsMax 
     * @param {Pointer<Guid>} pClsidProfiler 
     * @param {PWSTR} wszProfilerPath 
     * @param {Pointer<Void>} pvClientData 
     * @param {Integer} cbClientData 
     * @returns {HRESULT} 
     */
    AttachProfiler(dwProfileeProcessID, dwMillisecondsMax, pClsidProfiler, wszProfilerPath, pvClientData, cbClientData) {
        wszProfilerPath := wszProfilerPath is String ? StrPtr(wszProfilerPath) : wszProfilerPath

        result := ComCall(3, this, "uint", dwProfileeProcessID, "uint", dwMillisecondsMax, "ptr", pClsidProfiler, "ptr", wszProfilerPath, "ptr", pvClientData, "uint", cbClientData, "HRESULT")
        return result
    }
}
