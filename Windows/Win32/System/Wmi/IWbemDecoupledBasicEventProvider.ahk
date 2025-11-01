#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemDecoupledRegistrar.ahk

/**
 * The IWbemDecoupledBasicEventProvider interface is a cocreatable interface that registers decoupled providers with WMI. The object created should be passed into the pUnknown argument of IWbemDecoupledRegistrar::Register.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemdecoupledbasiceventprovider
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemDecoupledBasicEventProvider extends IWbemDecoupledRegistrar{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemDecoupledBasicEventProvider
     * @type {Guid}
     */
    static IID => Guid("{86336d20-ca11-4786-9ef1-bc8a946b42fc}")

    /**
     * The class identifier for WbemDecoupledBasicEventProvider
     * @type {Guid}
     */
    static CLSID => Guid("{f5f75737-2843-4f22-933d-c76a97cda62f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSink", "GetService"]

    /**
     * 
     * @param {Integer} a_Flags 
     * @param {IWbemContext} a_Context 
     * @param {Pointer<IWbemObjectSink>} a_Sink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledbasiceventprovider-getsink
     */
    GetSink(a_Flags, a_Context, a_Sink) {
        result := ComCall(5, this, "int", a_Flags, "ptr", a_Context, "ptr*", a_Sink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} a_Flags 
     * @param {IWbemContext} a_Context 
     * @param {Pointer<IWbemServices>} a_Service 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemdecoupledbasiceventprovider-getservice
     */
    GetService(a_Flags, a_Context, a_Service) {
        result := ComCall(6, this, "int", a_Flags, "ptr", a_Context, "ptr*", a_Service, "HRESULT")
        return result
    }
}
