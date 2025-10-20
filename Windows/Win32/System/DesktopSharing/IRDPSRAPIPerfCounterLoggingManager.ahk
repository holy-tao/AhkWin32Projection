#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Manages IRDPSRAPIPerfCounterLogger objects.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiperfcounterloggingmanager
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIPerfCounterLoggingManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIPerfCounterLoggingManager
     * @type {Guid}
     */
    static IID => Guid("{9a512c86-ac6e-4a8e-b1a4-fcef363f6e64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLogger"]

    /**
     * 
     * @param {BSTR} bstrCounterName 
     * @param {Pointer<IRDPSRAPIPerfCounterLogger>} ppLogger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiperfcounterloggingmanager-createlogger
     */
    CreateLogger(bstrCounterName, ppLogger) {
        bstrCounterName := bstrCounterName is String ? BSTR.Alloc(bstrCounterName).Value : bstrCounterName

        result := ComCall(3, this, "ptr", bstrCounterName, "ptr*", ppLogger, "HRESULT")
        return result
    }
}
