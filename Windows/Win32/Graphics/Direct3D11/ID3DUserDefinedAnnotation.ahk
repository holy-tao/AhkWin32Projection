#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ID3DUserDefinedAnnotation interface enables an application to describe conceptual sections and markers within the application's code flow.
 * @remarks
 * 
 * The methods of <b>ID3DUserDefinedAnnotation</b> have no effect when the calling application is not running under a Direct3D-specific profiling tool like Visual Studio Ultimate 2012.
 * 
 * 
 * The <b>ID3DUserDefinedAnnotation</b> interface is published by Microsoft Direct3D 11 device contexts. Therefore, <b>ID3DUserDefinedAnnotation</b> has the same threading rules as the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface, or any other context interface. For more information about Direct3D threading, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread">MultiThreading</a>.
 * To retrieve the <b>ID3DUserDefinedAnnotation</b> interface for the context, call the <b>QueryInterface</b> method for the context (for example, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">ID3D11DeviceContext::QueryInterface</a>). In this call, you must pass the identifier of <b>ID3DUserDefinedAnnotation</b>. 
 * 
 * The <b>ID3DUserDefinedAnnotation</b> interface is the Microsoft Direct3D 10 and later equivalent of the Direct3D 9 <a href="https://msdn.microsoft.com/library/ee417071(v=VS.85).aspx">PIX functions</a> (D3DPERF_* functions).
 * 
 * <div class="alert"><b>Note</b>  Setting the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_PREVENT_ALTERING_LAYER_SETTINGS_FROM_REGISTRY</a> flag in your app replaces calling D3DPerf_SetOptions(1). But, to prevent Direct3D debugging tools from hooking your app, your app can also call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3duserdefinedannotation-getstatus">ID3DUserDefinedAnnotation::GetStatus</a> to determine whether it is running under a Direct3D debugging tool and then exit accordingly.</div>
 * <div> </div>
 * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3duserdefinedannotation-beginevent">BeginEvent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3duserdefinedannotation-endevent">EndEvent</a> methods in pairs; pairs of calls to these methods can nest within pairs of calls to these methods at a higher level in the application's call stack.  In other words, a "Draw World" section can entirely contain another section named "Draw Trees," which can in turn entirely contain a section called "Draw Oaks." You can only associate an <b>EndEvent</b> method with the most recent <b>BeginEvent</b> method, that is, pairs cannot overlap. You cannot call an <b>EndEvent</b> for any <b>BeginEvent</b> that preceded the most recent <b>BeginEvent</b>. In fact, the runtime interprets the first <b>EndEvent</b> as ending the second <b>BeginEvent</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3duserdefinedannotation
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3DUserDefinedAnnotation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DUserDefinedAnnotation
     * @type {Guid}
     */
    static IID => Guid("{b2daad8b-03d4-4dbf-95eb-32ab4b63d0ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginEvent", "EndEvent", "SetMarker", "GetStatus"]

    /**
     * Marks the beginning of a section of event code.
     * @param {PWSTR} Name A <b>NULL</b>-terminated <b>UNICODE</b> string that contains the name of the event. The name is not relevant to the operating system. You can choose a name that is meaningful when the calling application is running under the Direct3D profiling tool.
     * A <b>NULL</b> pointer produces undefined results.
     * @returns {Integer} Returns the number of previous calls to <b>BeginEvent</b> that have not yet been finalized by calls to the <a href="/windows/desktop/api/d3d11_1/nf-d3d11_1-id3duserdefinedannotation-endevent">ID3DUserDefinedAnnotation::EndEvent</a> method.
     * 
     * The return value is –1 if the calling application is not running under a Direct3D profiling tool.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3duserdefinedannotation-beginevent
     */
    BeginEvent(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", Name, "int")
        return result
    }

    /**
     * Marks the end of a section of event code.
     * @returns {Integer} Returns the number of previous calls to the <a href="/windows/desktop/api/d3d11_1/nf-d3d11_1-id3duserdefinedannotation-beginevent">ID3DUserDefinedAnnotation::BeginEvent</a> method that have not yet been finalized by calls to <b>EndEvent</b>.
     * 
     * The return value is –1 if the calling application is not running under a Direct3D profiling tool.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3duserdefinedannotation-endevent
     */
    EndEvent() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Marks a single point of execution in code.
     * @remarks
     * 
     * A user can visualize the marker when the calling application is running under an enabled Direct3D profiling tool such as Microsoft Visual Studio Ultimate 2012.
     * 
     * <b>SetMarker</b> has no effect if the calling application is not running under an enabled Direct3D profiling tool.
     * 
     * 
     * 
     * @param {PWSTR} Name A <b>NULL</b>-terminated <b>UNICODE</b> string that contains the name of the marker. The name is not relevant to the operating system. You can choose a name that is meaningful when the calling application is running under the Direct3D profiling tool.
     * A <b>NULL</b> pointer produces undefined results.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3duserdefinedannotation-setmarker
     */
    SetMarker(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        ComCall(5, this, "ptr", Name)
    }

    /**
     * Determines whether the calling application is running under a Microsoft Direct3D profiling tool.
     * @returns {BOOL} The return value is nonzero if the calling application is running under a Direct3D profiling tool such as Visual Studio Ultimate 2012, and zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3duserdefinedannotation-getstatus
     */
    GetStatus() {
        result := ComCall(6, this, "int")
        return result
    }
}
