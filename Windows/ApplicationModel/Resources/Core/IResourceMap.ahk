#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ResourceCandidate.ahk
#Include .\ResourceMap.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceMap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceMap
     * @type {Guid}
     */
    static IID => Guid("{72284824-db8c-42f8-b08c-53ff357dad82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uri", "GetValue", "GetValueForContext", "GetSubtree"]

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(6, this, "ptr*", &uri_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(uri_)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetValueAndName
     * @param {HSTRING} resource 
     * @returns {ResourceCandidate} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecmetadata-getvalueandname
     */
    GetValue(resource) {
        if(resource is String) {
            pin := HSTRING.Create(resource)
            resource := pin.Value
        }
        resource := resource is Win32Handle ? NumGet(resource, "ptr") : resource

        result := ComCall(7, this, "ptr", resource, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceCandidate(value)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetValueAndName
     * @param {HSTRING} resource 
     * @param {ResourceContext} context_ 
     * @returns {ResourceCandidate} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecmetadata-getvalueandname
     */
    GetValueForContext(resource, context_) {
        if(resource is String) {
            pin := HSTRING.Create(resource)
            resource := pin.Value
        }
        resource := resource is Win32Handle ? NumGet(resource, "ptr") : resource

        result := ComCall(8, this, "ptr", resource, "ptr", context_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceCandidate(value)
    }

    /**
     * 
     * @param {HSTRING} reference_ 
     * @returns {ResourceMap} 
     */
    GetSubtree(reference_) {
        if(reference_ is String) {
            pin := HSTRING.Create(reference_)
            reference_ := pin.Value
        }
        reference_ := reference_ is Win32Handle ? NumGet(reference_, "ptr") : reference_

        result := ComCall(9, this, "ptr", reference_, "ptr*", &map := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceMap(map)
    }
}
