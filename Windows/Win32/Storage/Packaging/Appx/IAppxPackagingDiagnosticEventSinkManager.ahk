#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxPackagingDiagnosticEventSinkManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxPackagingDiagnosticEventSinkManager
     * @type {Guid}
     */
    static IID => Guid("{369648fa-a7eb-4909-a15d-6954a078f18a}")

    /**
     * The class identifier for AppxPackagingDiagnosticEventSinkManager
     * @type {Guid}
     */
    static CLSID => Guid("{50ca0a46-1588-4161-8ed2-ef9e469ced5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSinkForProcess"]

    /**
     * 
     * @param {IAppxPackagingDiagnosticEventSink} sink 
     * @returns {HRESULT} 
     */
    SetSinkForProcess(sink) {
        result := ComCall(3, this, "ptr", sink, "HRESULT")
        return result
    }
}
