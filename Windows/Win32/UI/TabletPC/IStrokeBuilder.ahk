#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PACKET_PROPERTY.ahk" { PACKET_PROPERTY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInkDisp.ahk" { IInkDisp }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IInkStrokeDisp.ahk" { IInkStrokeDisp }

/**
 * Use interface to programmatically create strokes from packet data.
 * @remarks
 * This interface is implemented by the <a href="https://docs.microsoft.com/windows/desktop/tablet/strokebuilder-class">StrokeBuilder Class</a>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/tablet/strokebuilder-class">StrokeBuilder Class</a> provides an alternative method of creating a stroke for applications that manage the data. It has methods that can be called from <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusdown">StylusDown</a>, <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-packets">Packets</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusup">StylusUp</a> notifications.
 * 
 * The following two models are supported.
 * 
 * <ul>
 * <li>Converting custom stroke information to a stroke in an atomic fashion by using the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-createstroke">IStrokeBuilder::CreateStroke Method</a> method.</li>
 * <li>Building the stroke by using the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-beginstroke">IStrokeBuilder::BeginStroke Method</a>, <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-appendpackets">IStrokeBuilder::AppendPackets Method</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-endstroke">IStrokeBuilder::EndStroke Method</a> methods, which mirror the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusdown">StylusDown</a>, <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-packets">Packets</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusup">StylusUp</a> notifications.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/nn-rtscom-istrokebuilder
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IStrokeBuilder extends IUnknown {
    /**
     * The interface identifier for IStrokeBuilder
     * @type {Guid}
     */
    static IID := Guid("{a5fd4e2d-c44b-4092-9177-260905eb672b}")

    /**
     * The class identifier for StrokeBuilder
     * @type {Guid}
     */
    static CLSID := Guid("{e810cee7-6e51-4cb0-aa3a-0b985b70daf7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStrokeBuilder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateStroke  : IntPtr
        BeginStroke   : IntPtr
        AppendPackets : IntPtr
        EndStroke     : IntPtr
        get_Ink       : IntPtr
        putref_Ink    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStrokeBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IInkDisp} 
     */
    Ink {
        get => this.get_Ink()
    }

    /**
     * Creates strokes on an ink object by using packet data that came from a RealTimeStylus Class object.
     * @remarks
     * The <i>fInkToDeviceScaleX</i> and <i>fInkToDeviceScaleY</i> parameters affect the internal representation of strokes created with the <b>IStrokeBuilder::CreateStroke Method</b> method. Multiply the x-coordinate in ink space by <i>fInkToDeviceScaleX</i> to get the x-coordinate in digitizer units. Multiply the y-coordinate in ink space by <i>fInkToDeviceScaleY</i> to get the y-coordinate in digitizer units.
     * 
     * To retrieve the scale parameters, use <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-getpacketdescriptiondata">IRealTimeStylus::GetPacketDescriptionData Method</a>.
     * @param {Integer} cPktBuffLength The number of LONGs in the <i>pPackets</i> array not the size in bytes. Valid values are between 0 and 0x000FFFFF, inclusive.
     * @param {Pointer<Integer>} pPackets A pointer to the start of the packet data.
     * @param {Integer} cPacketProperties The count of longs in the <i>pPacketProperties</i> buffer. This is the number of packets multiplied by the number of properties. Valid values are between 0 and 32, inclusive.
     * @param {Pointer<PACKET_PROPERTY>} pPacketProperties The buffer containing the packet properties.
     * @param {Float} fInkToDeviceScaleX The horizontal, or x-axis, conversion factor for the horizontal axis from ink space to digitizer coordinates.
     * @param {Float} fInkToDeviceScaleY The vertical, or y-axis, conversion factor for the vertical axis from ink space to digitizer coordinates.
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke A pointer to the newly created stroke. This value can be <b>NULL</b>.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-createstroke
     */
    CreateStroke(cPktBuffLength, pPackets, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke) {
        pPacketsMarshal := pPackets is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", cPktBuffLength, pPacketsMarshal, pPackets, "uint", cPacketProperties, PACKET_PROPERTY.Ptr, pPacketProperties, "float", fInkToDeviceScaleX, "float", fInkToDeviceScaleY, IInkStrokeDisp.Ptr, ppIInkStroke, "HRESULT")
        return result
    }

    /**
     * Begins a stroke on an ink object by using packet data from a RealTimeStylus Class object.
     * @remarks
     * Used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-appendpackets">IStrokeBuilder::AppendPackets Method</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istrokebuilder-endstroke">IStrokeBuilder::EndStroke Method</a> methods. <b>IStrokeBuilder::BeginStroke Method</b> starts building the stroke. As the motion continues and additional packets are received, the <b>IStrokeBuilder::AppendPackets Method</b> method adds that additional stroke data. When the tablet pen is raised from the surface and there are no more incoming packets, the <b>IStrokeBuilder::EndStroke Method</b> method is called.
     * @param {Integer} tcid The tablet context identifier.
     * @param {Integer} _sid The stylus identifier.
     * @param {Pointer<Integer>} pPacket The start of the packet data. It is read-only.
     * @param {Integer} cPacketProperties The count of LONGs, which is the number of packets multiplied by the number of properties, in the <i>pPacketProperties</i> buffer.
     * @param {Pointer<PACKET_PROPERTY>} pPacketProperties The buffer containing the packet properties.
     * @param {Float} fInkToDeviceScaleX The horizontal, or x-axis, conversion factor for the horizontal axis from ink space to digitizer coordinates.
     * @param {Float} fInkToDeviceScaleY The vertical, or y-axis, conversion factor for the vertical axis from ink space to digitizer coordinates.
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke A pointer to the new stroke. This value can be <b>NULL</b>.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-beginstroke
     */
    BeginStroke(tcid, _sid, pPacket, cPacketProperties, pPacketProperties, fInkToDeviceScaleX, fInkToDeviceScaleY, ppIInkStroke) {
        pPacketMarshal := pPacket is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", tcid, "uint", _sid, pPacketMarshal, pPacket, "uint", cPacketProperties, PACKET_PROPERTY.Ptr, pPacketProperties, "float", fInkToDeviceScaleX, "float", fInkToDeviceScaleY, IInkStrokeDisp.Ptr, ppIInkStroke, "HRESULT")
        return result
    }

    /**
     * Adds a packet to the end of the digitizer input packet list.
     * @remarks
     * This method should be called when data packets are sent as a result of the stylus moving while it is touching or in range of the digitizer.
     * 
     * <div class="alert"><b>Note</b>  The incoming packet data is in Himetric format and must be converted to pixels.</div>
     * <div> </div>
     * @param {Integer} tcid The context identifier for the tablet device to which the stylus belongs.
     * @param {Integer} _sid The identifier of the stylus object.
     * @param {Integer} cPktBuffLength The number of LONGs in the <i>pPackets</i> array not the size in bytes. Valid values are between 0 and 0x7FFF, inclusive.
     * @param {Pointer<Integer>} pPackets The start of the packet data. It is read-only.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-appendpackets
     */
    AppendPackets(tcid, _sid, cPktBuffLength, pPackets) {
        pPacketsMarshal := pPackets is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "uint", tcid, "uint", _sid, "uint", cPktBuffLength, pPacketsMarshal, pPackets, "HRESULT")
        return result
    }

    /**
     * Ends a stroke and returns the stroke object.
     * @remarks
     * A dirty region describes a tablet range which has been changed.
     * @param {Integer} tcid The tablet context identifier.
     * @param {Integer} _sid The stylus identifier.
     * @param {Pointer<IInkStrokeDisp>} ppIInkStroke A pointer to the new stroke. This value can be <b>NULL</b>.
     * @param {Pointer<RECT>} pDirtyRect The dirty, or changed, rectangle of the tablet. This value can be <b>NULL</b>.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>..
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-endstroke
     */
    EndStroke(tcid, _sid, ppIInkStroke, pDirtyRect) {
        result := ComCall(6, this, "uint", tcid, "uint", _sid, IInkStrokeDisp.Ptr, ppIInkStroke, RECT.Ptr, pDirtyRect, "HRESULT")
        return result
    }

    /**
     * Gets or sets the ink object that is associated with the IStrokeBuilder object.
     * @returns {IInkDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istrokebuilder-get_ink
     */
    get_Ink() {
        result := ComCall(7, this, "ptr*", &ppiInkObj := 0, "HRESULT")
        return IInkDisp(ppiInkObj)
    }

    /**
     * 
     * @param {IInkDisp} piInkObj 
     * @returns {HRESULT} 
     */
    putref_Ink(piInkObj) {
        result := ComCall(8, this, "ptr", piInkObj, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStrokeBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateStroke := CallbackCreate(GetMethod(implObj, "CreateStroke"), flags, 8)
        this.vtbl.BeginStroke := CallbackCreate(GetMethod(implObj, "BeginStroke"), flags, 9)
        this.vtbl.AppendPackets := CallbackCreate(GetMethod(implObj, "AppendPackets"), flags, 5)
        this.vtbl.EndStroke := CallbackCreate(GetMethod(implObj, "EndStroke"), flags, 5)
        this.vtbl.get_Ink := CallbackCreate(GetMethod(implObj, "get_Ink"), flags, 2)
        this.vtbl.putref_Ink := CallbackCreate(GetMethod(implObj, "putref_Ink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateStroke)
        CallbackFree(this.vtbl.BeginStroke)
        CallbackFree(this.vtbl.AppendPackets)
        CallbackFree(this.vtbl.EndStroke)
        CallbackFree(this.vtbl.get_Ink)
        CallbackFree(this.vtbl.putref_Ink)
    }
}
