#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\IReference.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The ISelector interface is used to select source nodes in a stream class driver.
 * @remarks
 * A kernel-streaming (KS) filter contains one or more <i>nodes</i>. Each node encapsulates a processing task that is applied to the stream. In the following diagram, nodes 1 and 2 are <i>source</i> nodes and node 3 is a <i>selector</i> node.
 * 
 * <img alt="KsProxy nodes" border="0" src="./images/ksproxynodes.png"/>
 * 
 * The source nodes represent input streams—for example, a camera or a tape transport. The selector node controls which stream is sent to the filter's output pin. To switch between inputs, an application would do the following:
 * 
 * <ol>
 * <li>Use the <a href="https://docs.microsoft.com/windows/win32/api/vidcap/nn-vidcap-ikstopologyinfo">IKsTopologyInfo</a> interface to enumerate the nodes and discover the node types, identifiers, and names.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-createnodeinstance">IKsTopologyInfo::CreateNodeInstance</a> to create the selector node, passing in the node identifier and the interface identifier IID_ISelector. The method returns an <c>ISelector</c> interface pointer.</li>
 * <li>Use the <c>ISelector</c> interface to select the source node.</li>
 * </ol>
 * The <c>ISelector</c> interface is available if the selector node supports the PROPSETID_VIDCAP_SELECTOR property set. For more information, see the Windows DDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api//content/vidcap/nn-vidcap-iselector
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ISelector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelector
     * @type {Guid}
     */
    static IID => Guid("{e30eb3a5-b36b-42dc-8527-cd25136c083c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedIndex", "put_SelectedIndex", "get_SelectedItem", "put_SelectedItem", "get_SelectedValue", "put_SelectedValue", "get_SelectedValuePath", "put_SelectedValuePath", "get_IsSynchronizedWithCurrentItem", "put_IsSynchronizedWithCurrentItem", "add_SelectionChanged", "remove_SelectionChanged"]

    /**
     * @type {Integer} 
     */
    SelectedIndex {
        get => this.get_SelectedIndex()
        set => this.put_SelectedIndex(value)
    }

    /**
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
        set => this.put_SelectedItem(value)
    }

    /**
     * @type {IInspectable} 
     */
    SelectedValue {
        get => this.get_SelectedValue()
        set => this.put_SelectedValue(value)
    }

    /**
     * @type {HSTRING} 
     */
    SelectedValuePath {
        get => this.get_SelectedValuePath()
        set => this.put_SelectedValuePath(value)
    }

    /**
     * @type {IReference<Boolean>} 
     */
    IsSynchronizedWithCurrentItem {
        get => this.get_IsSynchronizedWithCurrentItem()
        set => this.put_IsSynchronizedWithCurrentItem(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedIndex() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedIndex(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedItem(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedValue() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedValue(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SelectedValuePath() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SelectedValuePath(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsSynchronizedWithCurrentItem() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_IsSynchronizedWithCurrentItem(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SelectionChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
