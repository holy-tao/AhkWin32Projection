#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Enables the application to defer the creation of an object.
 * @remarks
 * Typically, the application calls some function that returns an <b>IMFActivate</b> pointer and then passes that pointer to another component. The other component calls <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">ActivateObject</a> at a later time to create the object. In the protected media path (PMP), the <b>IMFActivate</b> pointer might be marshaled to the protected process, so that the object can be created in that process.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nn-mfobjects-imfactivate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFActivate extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFActivate
     * @type {Guid}
     */
    static IID => Guid("{7fee9e9a-4a89-47a6-899c-b6a53a70fb67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateObject", "ShutdownObject", "DetachObject"]

    /**
     * Creates the object associated with this activation object.
     * @remarks
     * Some Microsoft Media Foundation objects must be shut down before being released. If so, the caller is responsible for shutting down the object that is returned in <i>ppv</i>. To shut down the object, do one of the following:
     * 
     * <ul>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-shutdownobject">IMFActivate::ShutdownObject</a> on the activation object, or</li>
     * <li>Call the object-specific shutdown method. This method will depend on the type of object. Possibilities include:<ul>
     * <li>Media sources: Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">IMFMediaSource::Shutdown</a>.</li>
     * <li>Media sinks: Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">IMFMediaSink::Shutdown</a>.</li>
     * <li>Any object that supports the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfshutdown">IMFShutdown</a> interface: Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfshutdown-shutdown">IMFShutdown::Shutdown</a>.</li>
     * </ul>
     * </li>
     * </ul>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-shutdownobject">IMFActivate::ShutdownObject</a> method is generic to all object types. If the object does not require a shutdown method, <b>ShutdownObject</b> succeeds and has no effect. If you do not know the specific shutdown method for the object (or do not know the object type), call <b>IMFActivate::ShutdownObject</b>.
     * 
     * After the first call to <b>ActivateObject</b>, subsequent calls return a pointer to the same instance, until the client calls either <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-shutdownobject">ShutdownObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-detachobject">IMFActivate::DetachObject</a>.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the requested interface.
     * @returns {Pointer<Pointer<Void>>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfactivate-activateobject
     */
    ActivateObject(riid) {
        result := ComCall(33, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Shuts down the created object.
     * @remarks
     * If you create an object by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a>, call <b>ShutdownObject</b> when you are done using the object.
     * 
     * The component that calls <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">ActivateObject</a>—not the component that creates the activation object—is responsible for calling <b>ShutdownObject</b>. For example, in a typical playback application, the application creates activation objects for the media sinks, but the Media Session calls <b>ActivateObject</b>. Therefore the Media Session, not the application, calls <b>ShutdownObject</b>.
     * 
     * After <b>ShutdownObject</b> is called, the activation object releases all of its internal references to the created object. If you call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">ActivateObject</a> again, the activation object will create a new instance of the other object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfactivate-shutdownobject
     */
    ShutdownObject() {
        result := ComCall(34, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Detaches the created object from the activation object.
     * @remarks
     * The activation object releases all of its internal references to the created object. If you call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">ActivateObject</a> again, the activation object will create a new instance of the other object.
     * 
     * The <b>DetachObject</b> method does not shut down the created object. If the <b>DetachObject</b> method succeeds, the client must shut down the created object. This rule applies only to objects that have a shutdown method or that support the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfshutdown">IMFShutdown</a> interface. See the remarks for <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a>.
     * 
     * Implementation of this method is optional. If the activation object does not support this method, the method returns E_NOTIMPL.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfactivate-detachobject
     */
    DetachObject() {
        result := ComCall(35, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
