#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetSharingPortMappingProps.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingPortMapping interface provides methods for managing a particular port mapping.
 * @remarks
 * 
  * Use the 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingconfiguration-addportmapping">INetSharingConfiguration::AddPortMapping</a> and 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netcon/nf-netcon-inetsharingconfiguration-get_enumportmappings">INetSharingConfiguration::EnumPortMappings</a> methods to obtain 
  * <b>INetSharingPortMapping</b> interfaces.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingportmapping
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingPortMapping extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetSharingPortMapping
     * @type {Guid}
     */
    static IID => Guid("{c08956b1-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Disable", "Enable", "get_Properties", "Delete"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmapping-disable
     */
    Disable() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmapping-enable
     */
    Enable() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {INetSharingPortMappingProps} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmapping-get_properties
     */
    get_Properties() {
        result := ComCall(9, this, "ptr*", &ppNSPMP := 0, "HRESULT")
        return INetSharingPortMappingProps(ppNSPMP)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmapping-delete
     */
    Delete() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
