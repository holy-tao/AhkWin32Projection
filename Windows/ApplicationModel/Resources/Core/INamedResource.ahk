#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\ResourceCandidate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class INamedResource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamedResource
     * @type {Guid}
     */
    static IID => Guid("{1c98c219-0b13-4240-89a5-d495dc189a00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uri", "get_Candidates", "Resolve", "ResolveForContext", "ResolveAll", "ResolveAllForContext"]

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * @type {IVectorView<ResourceCandidate>} 
     */
    Candidates {
        get => this.get_Candidates()
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
     * 
     * @returns {IVectorView<ResourceCandidate>} 
     */
    get_Candidates() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ResourceCandidate, value)
    }

    /**
     * Locates the target function of the specified import and replaces the function pointer in the import thunk with the target of the function implementation.
     * @returns {ResourceCandidate} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DevNotes/resolvedelayloadedapi
     */
    Resolve() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceCandidate(result_)
    }

    /**
     * Locates the target function of the specified import and replaces the function pointer in the import thunk with the target of the function implementation.
     * @param {ResourceContext} resourceContext_ 
     * @returns {ResourceCandidate} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DevNotes/resolvedelayloadedapi
     */
    ResolveForContext(resourceContext_) {
        result := ComCall(9, this, "ptr", resourceContext_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceCandidate(result_)
    }

    /**
     * 
     * @returns {IVectorView<ResourceCandidate>} 
     */
    ResolveAll() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ResourceCandidate, result_)
    }

    /**
     * 
     * @param {ResourceContext} resourceContext_ 
     * @returns {IVectorView<ResourceCandidate>} 
     */
    ResolveAllForContext(resourceContext_) {
        result := ComCall(11, this, "ptr", resourceContext_, "ptr*", &instances := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ResourceCandidate, instances)
    }
}
