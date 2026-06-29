#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\D3DKMT_OPENSYNCHRONIZATIONOBJECT.ahk" { D3DKMT_OPENSYNCHRONIZATIONOBJECT }
#Import ".\D3DKMT_REGISTERTRIMNOTIFICATION.ahk" { D3DKMT_REGISTERTRIMNOTIFICATION }
#Import ".\D3DKMT_CANCEL_PRESENTS.ahk" { D3DKMT_CANCEL_PRESENTS }
#Import ".\D3DKMT_RECLAIMALLOCATIONS.ahk" { D3DKMT_RECLAIMALLOCATIONS }
#Import ".\D3DKMT_ESCAPE.ahk" { D3DKMT_ESCAPE }
#Import ".\D3DKMT_LOCK2.ahk" { D3DKMT_LOCK2 }
#Import ".\D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT2.ahk" { D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT2 }
#Import ".\D3DKMT_GETALLOCATIONPRIORITY.ahk" { D3DKMT_GETALLOCATIONPRIORITY }
#Import ".\D3DKMT_CREATEPAGINGQUEUE.ahk" { D3DKMT_CREATEPAGINGQUEUE }
#Import ".\D3DKMT_CREATE_OUTPUTDUPL.ahk" { D3DKMT_CREATE_OUTPUTDUPL }
#Import ".\D3DKMT_CREATEDEVICE.ahk" { D3DKMT_CREATEDEVICE }
#Import ".\D3DKMT_DESTROYDEVICE.ahk" { D3DKMT_DESTROYDEVICE }
#Import ".\D3DDDI_RESERVEGPUVIRTUALADDRESS.ahk" { D3DDDI_RESERVEGPUVIRTUALADDRESS }
#Import ".\D3DKMT_CREATEDCFROMMEMORY.ahk" { D3DKMT_CREATEDCFROMMEMORY }
#Import ".\D3DKMT_SETVIDPNSOURCEOWNER.ahk" { D3DKMT_SETVIDPNSOURCEOWNER }
#Import ".\D3DKMT_CHANGEVIDEOMEMORYRESERVATION.ahk" { D3DKMT_CHANGEVIDEOMEMORYRESERVATION }
#Import ".\D3DKMT_CREATECONTEXT.ahk" { D3DKMT_CREATECONTEXT }
#Import ".\D3DKMT_OPENSYNCOBJECTFROMNTHANDLE2.ahk" { D3DKMT_OPENSYNCOBJECTFROMNTHANDLE2 }
#Import ".\D3DKMT_DESTROYOVERLAY.ahk" { D3DKMT_DESTROYOVERLAY }
#Import ".\D3DKMT_SETVIDPNSOURCEHWPROTECTION.ahk" { D3DKMT_SETVIDPNSOURCEHWPROTECTION }
#Import ".\D3DKMT_GETOVERLAYSTATE.ahk" { D3DKMT_GETOVERLAYSTATE }
#Import ".\D3DKMT_SIGNALSYNCHRONIZATIONOBJECT.ahk" { D3DKMT_SIGNALSYNCHRONIZATIONOBJECT }
#Import ".\D3DKMT_DESTROYSYNCHRONIZATIONOBJECT.ahk" { D3DKMT_DESTROYSYNCHRONIZATIONOBJECT }
#Import ".\D3DKMT_DESTROY_OUTPUTDUPL.ahk" { D3DKMT_DESTROY_OUTPUTDUPL }
#Import ".\D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT3.ahk" { D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT3 }
#Import ".\D3DKMT_SUBMITPRESENTBLTTOHWQUEUE.ahk" { D3DKMT_SUBMITPRESENTBLTTOHWQUEUE }
#Import "..\..\Foundation\OBJECT_ATTRIBUTES.ahk" { OBJECT_ATTRIBUTES }
#Import ".\D3DKMT_DESTROYDCFROMMEMORY.ahk" { D3DKMT_DESTROYDCFROMMEMORY }
#Import ".\D3DKMT_OPENNTHANDLEFROMNAME.ahk" { D3DKMT_OPENNTHANDLEFROMNAME }
#Import ".\D3DKMT_WAITFORVERTICALBLANKEVENT.ahk" { D3DKMT_WAITFORVERTICALBLANKEVENT }
#Import ".\D3DKMT_CREATEALLOCATION.ahk" { D3DKMT_CREATEALLOCATION }
#Import ".\D3DKMT_CREATESYNCHRONIZATIONOBJECT.ahk" { D3DKMT_CREATESYNCHRONIZATIONOBJECT }
#Import ".\D3DKMT_OUTPUTDUPLPRESENTTOHWQUEUE.ahk" { D3DKMT_OUTPUTDUPLPRESENTTOHWQUEUE }
#Import ".\D3DKMT_ACQUIREKEYEDMUTEX2.ahk" { D3DKMT_ACQUIREKEYEDMUTEX2 }
#Import ".\D3DKMT_SETFSEBLOCK.ahk" { D3DKMT_SETFSEBLOCK }
#Import ".\D3DKMT_SUBMITPRESENTTOHWQUEUE.ahk" { D3DKMT_SUBMITPRESENTTOHWQUEUE }
#Import ".\D3DKMT_EVICT.ahk" { D3DKMT_EVICT }
#Import ".\D3DKMT_CLOSEADAPTER.ahk" { D3DKMT_CLOSEADAPTER }
#Import ".\D3DKMT_QUERYRESOURCEINFOFROMNTHANDLE.ahk" { D3DKMT_QUERYRESOURCEINFOFROMNTHANDLE }
#Import ".\D3DKMT_OPENSYNCOBJECTNTHANDLEFROMNAME.ahk" { D3DKMT_OPENSYNCOBJECTNTHANDLEFROMNAME }
#Import ".\D3DKMT_QUERYPROTECTEDSESSIONINFOFROMNTHANDLE.ahk" { D3DKMT_QUERYPROTECTEDSESSIONINFOFROMNTHANDLE }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DKMT_SUBMITCOMMAND.ahk" { D3DKMT_SUBMITCOMMAND }
#Import ".\D3DKMT_CREATEKEYEDMUTEX.ahk" { D3DKMT_CREATEKEYEDMUTEX }
#Import ".\D3DKMT_INVALIDATEACTIVEVIDPN.ahk" { D3DKMT_INVALIDATEACTIVEVIDPN }
#Import ".\D3DKMT_DESTROYPROTECTEDSESSION.ahk" { D3DKMT_DESTROYPROTECTEDSESSION }
#Import ".\D3DKMT_GETSCANLINE.ahk" { D3DKMT_GETSCANLINE }
#Import ".\D3DKMT_OPENSYNCOBJECTFROMNTHANDLE.ahk" { D3DKMT_OPENSYNCOBJECTFROMNTHANDLE }
#Import ".\D3DKMT_GETVERTICALBLANKEVENT.ahk" { D3DKMT_GETVERTICALBLANKEVENT }
#Import ".\D3DKMT_TRIMPROCESSCOMMITMENT.ahk" { D3DKMT_TRIMPROCESSCOMMITMENT }
#Import ".\D3DKMT_SETVIDPNSOURCEOWNER1.ahk" { D3DKMT_SETVIDPNSOURCEOWNER1 }
#Import ".\D3DKMT_PRESENT_REDIRECTED.ahk" { D3DKMT_PRESENT_REDIRECTED }
#Import ".\D3DKMT_GETCONTEXTINPROCESSSCHEDULINGPRIORITY.ahk" { D3DKMT_GETCONTEXTINPROCESSSCHEDULINGPRIORITY }
#Import ".\D3DKMT_CHECKVIDPNEXCLUSIVEOWNERSHIP.ahk" { D3DKMT_CHECKVIDPNEXCLUSIVEOWNERSHIP }
#Import ".\D3DKMT_CREATEPROTECTEDSESSION.ahk" { D3DKMT_CREATEPROTECTEDSESSION }
#Import ".\D3DKMT_OPENADAPTERFROMLUID.ahk" { D3DKMT_OPENADAPTERFROMLUID }
#Import ".\D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT.ahk" { D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT }
#Import ".\D3DKMT_ACQUIREKEYEDMUTEX.ahk" { D3DKMT_ACQUIREKEYEDMUTEX }
#Import ".\D3DKMT_QUERYSTATISTICS.ahk" { D3DKMT_QUERYSTATISTICS }
#Import ".\D3DKMT_GETSHAREDRESOURCEADAPTERLUID.ahk" { D3DKMT_GETSHAREDRESOURCEADAPTERLUID }
#Import ".\D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMGPU.ahk" { D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMGPU }
#Import ".\D3DKMT_GETRUNTIMEDATA.ahk" { D3DKMT_GETRUNTIMEDATA }
#Import ".\D3DKMT_ENUMADAPTERS2.ahk" { D3DKMT_ENUMADAPTERS2 }
#Import ".\D3DKMT_DESTROYCONTEXT.ahk" { D3DKMT_DESTROYCONTEXT }
#Import ".\D3DKMT_CREATECONTEXTVIRTUAL.ahk" { D3DKMT_CREATECONTEXTVIRTUAL }
#Import ".\D3DKMT_GET_MULTIPLANE_OVERLAY_CAPS.ahk" { D3DKMT_GET_MULTIPLANE_OVERLAY_CAPS }
#Import ".\D3DKMT_OUTPUTDUPL_GET_POINTER_SHAPE_DATA.ahk" { D3DKMT_OUTPUTDUPL_GET_POINTER_SHAPE_DATA }
#Import ".\D3DKMT_FLIPOVERLAY.ahk" { D3DKMT_FLIPOVERLAY }
#Import ".\D3DKMT_GETDEVICESTATE.ahk" { D3DKMT_GETDEVICESTATE }
#Import ".\D3DKMT_INVALIDATECACHE.ahk" { D3DKMT_INVALIDATECACHE }
#Import ".\D3DKMT_GETCONTEXTSCHEDULINGPRIORITY.ahk" { D3DKMT_GETCONTEXTSCHEDULINGPRIORITY }
#Import ".\D3DKMT_SETGAMMARAMP.ahk" { D3DKMT_SETGAMMARAMP }
#Import ".\D3DKMT_PRESENT_MULTIPLANE_OVERLAY3.ahk" { D3DKMT_PRESENT_MULTIPLANE_OVERLAY3 }
#Import ".\D3DKMT_OUTPUTDUPL_METADATA.ahk" { D3DKMT_OUTPUTDUPL_METADATA }
#Import ".\D3DKMT_RENDER.ahk" { D3DKMT_RENDER }
#Import ".\D3DKMT_SETQUEUEDLIMIT.ahk" { D3DKMT_SETQUEUEDLIMIT }
#Import ".\D3DKMT_WAITFORIDLE.ahk" { D3DKMT_WAITFORIDLE }
#Import ".\D3DKMT_OPENRESOURCE.ahk" { D3DKMT_OPENRESOURCE }
#Import ".\D3DKMT_WAITFORSYNCHRONIZATIONOBJECT2.ahk" { D3DKMT_WAITFORSYNCHRONIZATIONOBJECT2 }
#Import ".\D3DKMT_QUERYFSEBLOCK.ahk" { D3DKMT_QUERYFSEBLOCK }
#Import ".\D3DDDI_GETRESOURCEPRESENTPRIVATEDRIVERDATA.ahk" { D3DDDI_GETRESOURCEPRESENTPRIVATEDRIVERDATA }
#Import ".\D3DDDI_DESTROYPAGINGQUEUE.ahk" { D3DDDI_DESTROYPAGINGQUEUE }
#Import ".\D3DKMT_OPENKEYEDMUTEX2.ahk" { D3DKMT_OPENKEYEDMUTEX2 }
#Import ".\D3DKMT_OUTPUTDUPL_RELEASE_FRAME.ahk" { D3DKMT_OUTPUTDUPL_RELEASE_FRAME }
#Import ".\D3DKMT_GETMULTISAMPLEMETHODLIST.ahk" { D3DKMT_GETMULTISAMPLEMETHODLIST }
#Import ".\D3DKMT_SET_COLORSPACE_TRANSFORM.ahk" { D3DKMT_SET_COLORSPACE_TRANSFORM }
#Import ".\D3DKMT_POLLDISPLAYCHILDREN.ahk" { D3DKMT_POLLDISPLAYCHILDREN }
#Import ".\D3DKMT_SHAREDPRIMARYLOCKNOTIFICATION.ahk" { D3DKMT_SHAREDPRIMARYLOCKNOTIFICATION }
#Import ".\D3DKMT_GETPROCESSDEVICEREMOVALSUPPORT.ahk" { D3DKMT_GETPROCESSDEVICEREMOVALSUPPORT }
#Import ".\D3DKMT_FREEGPUVIRTUALADDRESS.ahk" { D3DKMT_FREEGPUVIRTUALADDRESS }
#Import ".\D3DKMT_GETDISPLAYMODELIST.ahk" { D3DKMT_GETDISPLAYMODELIST }
#Import ".\D3DKMT_SETCONTEXTSCHEDULINGPRIORITY.ahk" { D3DKMT_SETCONTEXTSCHEDULINGPRIORITY }
#Import ".\D3DKMT_GET_POST_COMPOSITION_CAPS.ahk" { D3DKMT_GET_POST_COMPOSITION_CAPS }
#Import ".\D3DKMT_SUBMITCOMMANDTOHWQUEUE.ahk" { D3DKMT_SUBMITCOMMANDTOHWQUEUE }
#Import ".\D3DKMT_UNLOCK2.ahk" { D3DKMT_UNLOCK2 }
#Import ".\D3DKMT_DESTROYALLOCATION.ahk" { D3DKMT_DESTROYALLOCATION }
#Import ".\D3DKMT_MARKDEVICEASERROR.ahk" { D3DKMT_MARKDEVICEASERROR }
#Import ".\D3DKMT_QUERYRESOURCEINFO.ahk" { D3DKMT_QUERYRESOURCEINFO }
#Import ".\D3DKMT_ADJUSTFULLSCREENGAMMA.ahk" { D3DKMT_ADJUSTFULLSCREENGAMMA }
#Import ".\D3DKMT_RELEASEKEYEDMUTEX.ahk" { D3DKMT_RELEASEKEYEDMUTEX }
#Import ".\D3DKMT_ENUMADAPTERS3.ahk" { D3DKMT_ENUMADAPTERS3 }
#Import ".\D3DKMT_OPENPROTECTEDSESSIONFROMNTHANDLE.ahk" { D3DKMT_OPENPROTECTEDSESSIONFROMNTHANDLE }
#Import ".\D3DDDI_MAPGPUVIRTUALADDRESS.ahk" { D3DDDI_MAPGPUVIRTUALADDRESS }
#Import ".\D3DKMT_OUTPUTDUPLPRESENT.ahk" { D3DKMT_OUTPUTDUPLPRESENT }
#Import ".\D3DKMT_DESTROYHWQUEUE.ahk" { D3DKMT_DESTROYHWQUEUE }
#Import ".\D3DKMT_CREATESYNCHRONIZATIONOBJECT2.ahk" { D3DKMT_CREATESYNCHRONIZATIONOBJECT2 }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\D3DKMT_GETPRESENTHISTORY.ahk" { D3DKMT_GETPRESENTHISTORY }
#Import ".\D3DKMT_SETDISPLAYMODE.ahk" { D3DKMT_SETDISPLAYMODE }
#Import ".\D3DKMT_OPENKEYEDMUTEX.ahk" { D3DKMT_OPENKEYEDMUTEX }
#Import ".\D3DKMT_SETSTABLEPOWERSTATE.ahk" { D3DKMT_SETSTABLEPOWERSTATE }
#Import ".\D3DKMT_SETCONTEXTINPROCESSSCHEDULINGPRIORITY.ahk" { D3DKMT_SETCONTEXTINPROCESSSCHEDULINGPRIORITY }
#Import ".\D3DKMT_SUBMITWAITFORSYNCOBJECTSTOHWQUEUE.ahk" { D3DKMT_SUBMITWAITFORSYNCOBJECTSTOHWQUEUE }
#Import ".\D3DKMT_CHECKSHAREDRESOURCEACCESS.ahk" { D3DKMT_CHECKSHAREDRESOURCEACCESS }
#Import ".\D3DKMT_WAITFORSYNCHRONIZATIONOBJECT.ahk" { D3DKMT_WAITFORSYNCHRONIZATIONOBJECT }
#Import ".\D3DKMT_SETHWPROTECTIONTEARDOWNRECOVERY.ahk" { D3DKMT_SETHWPROTECTIONTEARDOWNRECOVERY }
#Import ".\D3DKMT_LOCK.ahk" { D3DKMT_LOCK }
#Import ".\D3DKMT_CHECKMONITORPOWERSTATE.ahk" { D3DKMT_CHECKMONITORPOWERSTATE }
#Import ".\D3DKMT_SHAREDPRIMARYUNLOCKNOTIFICATION.ahk" { D3DKMT_SHAREDPRIMARYUNLOCKNOTIFICATION }
#Import ".\D3DKMT_FLUSHHEAPTRANSITIONS.ahk" { D3DKMT_FLUSHHEAPTRANSITIONS }
#Import ".\D3DKMT_RELEASEKEYEDMUTEX2.ahk" { D3DKMT_RELEASEKEYEDMUTEX2 }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\D3DKMT_QUERYCLOCKCALIBRATION.ahk" { D3DKMT_QUERYCLOCKCALIBRATION }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3DKMT_QUERYVIDEOMEMORYINFO.ahk" { D3DKMT_QUERYVIDEOMEMORYINFO }
#Import ".\D3DKMT_DESTROYKEYEDMUTEX.ahk" { D3DKMT_DESTROYKEYEDMUTEX }
#Import ".\D3DKMT_OUTPUTDUPL_GET_FRAMEINFO.ahk" { D3DKMT_OUTPUTDUPL_GET_FRAMEINFO }
#Import ".\D3DKMT_SETVIDPNSOURCEOWNER2.ahk" { D3DKMT_SETVIDPNSOURCEOWNER2 }
#Import ".\D3DKMT_QUERYADAPTERINFO.ahk" { D3DKMT_QUERYADAPTERINFO }
#Import ".\D3DKMT_UPDATEOVERLAY.ahk" { D3DKMT_UPDATEOVERLAY }
#Import ".\D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU2.ahk" { D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU2 }
#Import ".\D3DKMT_CREATEOVERLAY.ahk" { D3DKMT_CREATEOVERLAY }
#Import ".\D3DKMT_QUERYVIDPNEXCLUSIVEOWNERSHIP.ahk" { D3DKMT_QUERYVIDPNEXCLUSIVEOWNERSHIP }
#Import ".\D3DKMT_QUERYREMOTEVIDPNSOURCEFROMGDIDISPLAYNAME.ahk" { D3DKMT_QUERYREMOTEVIDPNSOURCEFROMGDIDISPLAYNAME }
#Import ".\D3DKMT_SETALLOCATIONPRIORITY.ahk" { D3DKMT_SETALLOCATIONPRIORITY }
#Import ".\D3DKMT_SUBMITSIGNALSYNCOBJECTSTOHWQUEUE.ahk" { D3DKMT_SUBMITSIGNALSYNCOBJECTSTOHWQUEUE }
#Import ".\D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMCPU.ahk" { D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMCPU }
#Import ".\D3DDDI_UPDATEALLOCPROPERTY.ahk" { D3DDDI_UPDATEALLOCPROPERTY }
#Import ".\D3DKMT_GETSHAREDPRIMARYHANDLE.ahk" { D3DKMT_GETSHAREDPRIMARYHANDLE }
#Import ".\D3DKMT_DESTROYALLOCATION2.ahk" { D3DKMT_DESTROYALLOCATION2 }
#Import ".\D3DDDI_MAKERESIDENT.ahk" { D3DDDI_MAKERESIDENT }
#Import ".\D3DKMT_UPDATEGPUVIRTUALADDRESS.ahk" { D3DKMT_UPDATEGPUVIRTUALADDRESS }
#Import ".\D3DKMT_WAITFORVERTICALBLANKEVENT2.ahk" { D3DKMT_WAITFORVERTICALBLANKEVENT2 }
#Import ".\D3DKMT_UNLOCK.ahk" { D3DKMT_UNLOCK }
#Import ".\D3DKMT_OFFERALLOCATIONS.ahk" { D3DKMT_OFFERALLOCATIONS }
#Import ".\D3DKMT_PRESENT_MULTIPLANE_OVERLAY.ahk" { D3DKMT_PRESENT_MULTIPLANE_OVERLAY }
#Import ".\D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU.ahk" { D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU }
#Import ".\D3DKMT_CREATEKEYEDMUTEX2.ahk" { D3DKMT_CREATEKEYEDMUTEX2 }
#Import ".\D3DKMT_SETSYNCREFRESHCOUNTWAITTARGET.ahk" { D3DKMT_SETSYNCREFRESHCOUNTWAITTARGET }
#Import ".\D3DKMT_PRESENT_MULTIPLANE_OVERLAY2.ahk" { D3DKMT_PRESENT_MULTIPLANE_OVERLAY2 }
#Import ".\D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMCPU.ahk" { D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMCPU }
#Import ".\D3DKMT_OPENADAPTERFROMHDC.ahk" { D3DKMT_OPENADAPTERFROMHDC }
#Import ".\D3DKMT_ENUMADAPTERS.ahk" { D3DKMT_ENUMADAPTERS }
#Import ".\D3DKMT_DESTROYHWCONTEXT.ahk" { D3DKMT_DESTROYHWCONTEXT }
#Import ".\D3DKMT_SIGNALSYNCHRONIZATIONOBJECT2.ahk" { D3DKMT_SIGNALSYNCHRONIZATIONOBJECT2 }
#Import ".\D3DKMT_SCHEDULINGPRIORITYCLASS.ahk" { D3DKMT_SCHEDULINGPRIORITYCLASS }
#Import ".\D3DKMT_OPENADAPTERFROMGDIDISPLAYNAME.ahk" { D3DKMT_OPENADAPTERFROMGDIDISPLAYNAME }
#Import ".\D3DKMT_PRESENT.ahk" { D3DKMT_PRESENT }
#Import ".\D3DKMT_OPENKEYEDMUTEXFROMNTHANDLE.ahk" { D3DKMT_OPENKEYEDMUTEXFROMNTHANDLE }
#Import ".\D3DKMT_SETDISPLAYPRIVATEDRIVERFORMAT.ahk" { D3DKMT_SETDISPLAYPRIVATEDRIVERFORMAT }
#Import ".\D3DKMT_OPENADAPTERFROMDEVICENAME.ahk" { D3DKMT_OPENADAPTERFROMDEVICENAME }
#Import ".\D3DKMT_QUERYPROTECTEDSESSIONSTATUS.ahk" { D3DKMT_QUERYPROTECTEDSESSIONSTATUS }
#Import ".\D3DKMT_CHANGESURFACEPOINTER.ahk" { D3DKMT_CHANGESURFACEPOINTER }
#Import ".\D3DKMT_CREATEHWQUEUE.ahk" { D3DKMT_CREATEHWQUEUE }
#Import ".\D3DKMT_QUERYPROCESSOFFERINFO.ahk" { D3DKMT_QUERYPROCESSOFFERINFO }
#Import ".\D3DKMT_CONFIGURESHAREDRESOURCE.ahk" { D3DKMT_CONFIGURESHAREDRESOURCE }
#Import ".\D3DKMT_CHECKOCCLUSION.ahk" { D3DKMT_CHECKOCCLUSION }
#Import ".\D3DKMT_QUERYALLOCATIONRESIDENCY.ahk" { D3DKMT_QUERYALLOCATIONRESIDENCY }
#Import ".\D3DKMT_OPENRESOURCEFROMNTHANDLE.ahk" { D3DKMT_OPENRESOURCEFROMNTHANDLE }
#Import ".\D3DKMT_CREATEHWCONTEXT.ahk" { D3DKMT_CREATEHWCONTEXT }
#Import ".\D3DKMT_RECLAIMALLOCATIONS2.ahk" { D3DKMT_RECLAIMALLOCATIONS2 }
#Import ".\D3DKMT_UNREGISTERTRIMNOTIFICATION.ahk" { D3DKMT_UNREGISTERTRIMNOTIFICATION }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */

;@region Functions
/**
 * 
 * @param {Pointer<D3DKMT_CREATEALLOCATION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateAllocation(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateAllocation", D3DKMT_CREATEALLOCATION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEALLOCATION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateAllocation2(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateAllocation2", D3DKMT_CREATEALLOCATION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYRESOURCEINFO>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryResourceInfo(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryResourceInfo", D3DKMT_QUERYRESOURCEINFO.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYRESOURCEINFOFROMNTHANDLE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryResourceInfoFromNtHandle(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryResourceInfoFromNtHandle", D3DKMT_QUERYRESOURCEINFOFROMNTHANDLE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} cObjects 
 * @param {Pointer<Integer>} hObjects 
 * @param {Pointer<OBJECT_ATTRIBUTES>} pObjectAttributes 
 * @param {Integer} dwDesiredAccess 
 * @param {Pointer<HANDLE>} phSharedNtHandle 
 * @returns {NTSTATUS} 
 */
export D3DKMTShareObjects(cObjects, hObjects, pObjectAttributes, dwDesiredAccess, phSharedNtHandle) {
    hObjectsMarshal := hObjects is VarRef ? "uint*" : "ptr"

    result := DllCall("GDI32.dll\D3DKMTShareObjects", "uint", cObjects, hObjectsMarshal, hObjects, OBJECT_ATTRIBUTES.Ptr, pObjectAttributes, "uint", dwDesiredAccess, HANDLE.Ptr, phSharedNtHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENNTHANDLEFROMNAME>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenNtHandleFromName(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenNtHandleFromName", D3DKMT_OPENNTHANDLEFROMNAME.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENRESOURCEFROMNTHANDLE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenResourceFromNtHandle(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenResourceFromNtHandle", D3DKMT_OPENRESOURCEFROMNTHANDLE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENSYNCOBJECTFROMNTHANDLE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenSyncObjectFromNtHandle(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenSyncObjectFromNtHandle", D3DKMT_OPENSYNCOBJECTFROMNTHANDLE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENRESOURCE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenResource(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenResource", D3DKMT_OPENRESOURCE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENRESOURCE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenResource2(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenResource2", D3DKMT_OPENRESOURCE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYALLOCATION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyAllocation(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyAllocation", D3DKMT_DESTROYALLOCATION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYALLOCATION2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyAllocation2(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyAllocation2", D3DKMT_DESTROYALLOCATION2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETALLOCATIONPRIORITY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetAllocationPriority(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetAllocationPriority", D3DKMT_SETALLOCATIONPRIORITY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYALLOCATIONRESIDENCY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryAllocationResidency(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryAllocationResidency", D3DKMT_QUERYALLOCATIONRESIDENCY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEDEVICE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateDevice(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateDevice", D3DKMT_CREATEDEVICE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYDEVICE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyDevice(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyDevice", D3DKMT_DESTROYDEVICE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATECONTEXT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateContext(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateContext", D3DKMT_CREATECONTEXT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYCONTEXT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyContext(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyContext", D3DKMT_DESTROYCONTEXT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATESYNCHRONIZATIONOBJECT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateSynchronizationObject(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateSynchronizationObject", D3DKMT_CREATESYNCHRONIZATIONOBJECT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATESYNCHRONIZATIONOBJECT2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateSynchronizationObject2(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateSynchronizationObject2", D3DKMT_CREATESYNCHRONIZATIONOBJECT2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENSYNCHRONIZATIONOBJECT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenSynchronizationObject(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenSynchronizationObject", D3DKMT_OPENSYNCHRONIZATIONOBJECT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYSYNCHRONIZATIONOBJECT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroySynchronizationObject(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroySynchronizationObject", D3DKMT_DESTROYSYNCHRONIZATIONOBJECT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_WAITFORSYNCHRONIZATIONOBJECT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTWaitForSynchronizationObject(param0) {
    result := DllCall("GDI32.dll\D3DKMTWaitForSynchronizationObject", D3DKMT_WAITFORSYNCHRONIZATIONOBJECT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_WAITFORSYNCHRONIZATIONOBJECT2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTWaitForSynchronizationObject2(param0) {
    result := DllCall("GDI32.dll\D3DKMTWaitForSynchronizationObject2", D3DKMT_WAITFORSYNCHRONIZATIONOBJECT2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSignalSynchronizationObject(param0) {
    result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObject", D3DKMT_SIGNALSYNCHRONIZATIONOBJECT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECT2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSignalSynchronizationObject2(param0) {
    result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObject2", D3DKMT_SIGNALSYNCHRONIZATIONOBJECT2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_LOCK>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTLock(param0) {
    result := DllCall("GDI32.dll\D3DKMTLock", D3DKMT_LOCK.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_UNLOCK>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTUnlock(param0) {
    result := DllCall("GDI32.dll\D3DKMTUnlock", D3DKMT_UNLOCK.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETDISPLAYMODELIST>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetDisplayModeList(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetDisplayModeList", D3DKMT_GETDISPLAYMODELIST.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETDISPLAYMODE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetDisplayMode(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetDisplayMode", D3DKMT_SETDISPLAYMODE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETMULTISAMPLEMETHODLIST>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetMultisampleMethodList(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetMultisampleMethodList", D3DKMT_GETMULTISAMPLEMETHODLIST.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_PRESENT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTPresent(param0) {
    result := DllCall("GDI32.dll\D3DKMTPresent", D3DKMT_PRESENT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_RENDER>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTRender(param0) {
    result := DllCall("GDI32.dll\D3DKMTRender", D3DKMT_RENDER.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETRUNTIMEDATA>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetRuntimeData(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetRuntimeData", D3DKMT_GETRUNTIMEDATA.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYADAPTERINFO>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryAdapterInfo(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryAdapterInfo", D3DKMT_QUERYADAPTERINFO.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENADAPTERFROMHDC>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenAdapterFromHdc(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenAdapterFromHdc", D3DKMT_OPENADAPTERFROMHDC.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENADAPTERFROMGDIDISPLAYNAME>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenAdapterFromGdiDisplayName(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenAdapterFromGdiDisplayName", D3DKMT_OPENADAPTERFROMGDIDISPLAYNAME.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENADAPTERFROMDEVICENAME>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenAdapterFromDeviceName(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenAdapterFromDeviceName", D3DKMT_OPENADAPTERFROMDEVICENAME.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CLOSEADAPTER>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCloseAdapter(param0) {
    result := DllCall("GDI32.dll\D3DKMTCloseAdapter", D3DKMT_CLOSEADAPTER.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETSHAREDPRIMARYHANDLE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetSharedPrimaryHandle(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetSharedPrimaryHandle", D3DKMT_GETSHAREDPRIMARYHANDLE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_ESCAPE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTEscape(param0) {
    result := DllCall("GDI32.dll\D3DKMTEscape", D3DKMT_ESCAPE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYSTATISTICS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryStatistics(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryStatistics", D3DKMT_QUERYSTATISTICS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETVIDPNSOURCEOWNER>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetVidPnSourceOwner(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetVidPnSourceOwner", D3DKMT_SETVIDPNSOURCEOWNER.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETPRESENTHISTORY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetPresentHistory(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetPresentHistory", D3DKMT_GETPRESENTHISTORY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} hAdapter 
 * @param {Pointer<HANDLE>} param1 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetPresentQueueEvent(hAdapter, param1) {
    result := DllCall("GDI32.dll\D3DKMTGetPresentQueueEvent", "uint", hAdapter, HANDLE.Ptr, param1, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEOVERLAY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateOverlay(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateOverlay", D3DKMT_CREATEOVERLAY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_UPDATEOVERLAY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTUpdateOverlay(param0) {
    result := DllCall("GDI32.dll\D3DKMTUpdateOverlay", D3DKMT_UPDATEOVERLAY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_FLIPOVERLAY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTFlipOverlay(param0) {
    result := DllCall("GDI32.dll\D3DKMTFlipOverlay", D3DKMT_FLIPOVERLAY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYOVERLAY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyOverlay(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyOverlay", D3DKMT_DESTROYOVERLAY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_WAITFORVERTICALBLANKEVENT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTWaitForVerticalBlankEvent(param0) {
    result := DllCall("GDI32.dll\D3DKMTWaitForVerticalBlankEvent", D3DKMT_WAITFORVERTICALBLANKEVENT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETGAMMARAMP>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetGammaRamp(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetGammaRamp", D3DKMT_SETGAMMARAMP.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETDEVICESTATE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetDeviceState(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetDeviceState", D3DKMT_GETDEVICESTATE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEDCFROMMEMORY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateDCFromMemory(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateDCFromMemory", D3DKMT_CREATEDCFROMMEMORY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYDCFROMMEMORY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyDCFromMemory(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyDCFromMemory", D3DKMT_DESTROYDCFROMMEMORY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETCONTEXTSCHEDULINGPRIORITY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetContextSchedulingPriority(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetContextSchedulingPriority", D3DKMT_SETCONTEXTSCHEDULINGPRIORITY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETCONTEXTSCHEDULINGPRIORITY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetContextSchedulingPriority(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetContextSchedulingPriority", D3DKMT_GETCONTEXTSCHEDULINGPRIORITY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} param0 
 * @param {D3DKMT_SCHEDULINGPRIORITYCLASS} param1 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetProcessSchedulingPriorityClass(param0, param1) {
    result := DllCall("GDI32.dll\D3DKMTSetProcessSchedulingPriorityClass", HANDLE, param0, D3DKMT_SCHEDULINGPRIORITYCLASS, param1, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} param0 
 * @param {Pointer<D3DKMT_SCHEDULINGPRIORITYCLASS>} param1 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetProcessSchedulingPriorityClass(param0, param1) {
    param1Marshal := param1 is VarRef ? "int*" : "ptr"

    result := DllCall("GDI32.dll\D3DKMTGetProcessSchedulingPriorityClass", HANDLE, param0, param1Marshal, param1, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTReleaseProcessVidPnSourceOwners(param0) {
    result := DllCall("GDI32.dll\D3DKMTReleaseProcessVidPnSourceOwners", HANDLE, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETSCANLINE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetScanLine(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetScanLine", D3DKMT_GETSCANLINE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CHANGESURFACEPOINTER>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTChangeSurfacePointer(param0) {
    result := DllCall("GDI32.dll\D3DKMTChangeSurfacePointer", D3DKMT_CHANGESURFACEPOINTER.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETQUEUEDLIMIT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetQueuedLimit(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetQueuedLimit", D3DKMT_SETQUEUEDLIMIT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_POLLDISPLAYCHILDREN>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTPollDisplayChildren(param0) {
    result := DllCall("GDI32.dll\D3DKMTPollDisplayChildren", D3DKMT_POLLDISPLAYCHILDREN.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_INVALIDATEACTIVEVIDPN>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTInvalidateActiveVidPn(param0) {
    result := DllCall("GDI32.dll\D3DKMTInvalidateActiveVidPn", D3DKMT_INVALIDATEACTIVEVIDPN.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CHECKOCCLUSION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCheckOcclusion(param0) {
    result := DllCall("GDI32.dll\D3DKMTCheckOcclusion", D3DKMT_CHECKOCCLUSION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_WAITFORIDLE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTWaitForIdle(param0) {
    result := DllCall("GDI32.dll\D3DKMTWaitForIdle", D3DKMT_WAITFORIDLE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CHECKMONITORPOWERSTATE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCheckMonitorPowerState(param0) {
    result := DllCall("GDI32.dll\D3DKMTCheckMonitorPowerState", D3DKMT_CHECKMONITORPOWERSTATE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @returns {BOOLEAN} 
 */
export D3DKMTCheckExclusiveOwnership() {
    result := DllCall("GDI32.dll\D3DKMTCheckExclusiveOwnership", BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CHECKVIDPNEXCLUSIVEOWNERSHIP>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCheckVidPnExclusiveOwnership(param0) {
    result := DllCall("GDI32.dll\D3DKMTCheckVidPnExclusiveOwnership", D3DKMT_CHECKVIDPNEXCLUSIVEOWNERSHIP.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETDISPLAYPRIVATEDRIVERFORMAT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetDisplayPrivateDriverFormat(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetDisplayPrivateDriverFormat", D3DKMT_SETDISPLAYPRIVATEDRIVERFORMAT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SHAREDPRIMARYLOCKNOTIFICATION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSharedPrimaryLockNotification(param0) {
    result := DllCall("GDI32.dll\D3DKMTSharedPrimaryLockNotification", D3DKMT_SHAREDPRIMARYLOCKNOTIFICATION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SHAREDPRIMARYUNLOCKNOTIFICATION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSharedPrimaryUnLockNotification(param0) {
    result := DllCall("GDI32.dll\D3DKMTSharedPrimaryUnLockNotification", D3DKMT_SHAREDPRIMARYUNLOCKNOTIFICATION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEKEYEDMUTEX>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateKeyedMutex(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateKeyedMutex", D3DKMT_CREATEKEYEDMUTEX.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENKEYEDMUTEX>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenKeyedMutex(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenKeyedMutex", D3DKMT_OPENKEYEDMUTEX.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYKEYEDMUTEX>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyKeyedMutex(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyKeyedMutex", D3DKMT_DESTROYKEYEDMUTEX.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_ACQUIREKEYEDMUTEX>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTAcquireKeyedMutex(param0) {
    result := DllCall("GDI32.dll\D3DKMTAcquireKeyedMutex", D3DKMT_ACQUIREKEYEDMUTEX.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_RELEASEKEYEDMUTEX>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTReleaseKeyedMutex(param0) {
    result := DllCall("GDI32.dll\D3DKMTReleaseKeyedMutex", D3DKMT_RELEASEKEYEDMUTEX.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEKEYEDMUTEX2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateKeyedMutex2(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateKeyedMutex2", D3DKMT_CREATEKEYEDMUTEX2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENKEYEDMUTEX2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenKeyedMutex2(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenKeyedMutex2", D3DKMT_OPENKEYEDMUTEX2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_ACQUIREKEYEDMUTEX2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTAcquireKeyedMutex2(param0) {
    result := DllCall("GDI32.dll\D3DKMTAcquireKeyedMutex2", D3DKMT_ACQUIREKEYEDMUTEX2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_RELEASEKEYEDMUTEX2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTReleaseKeyedMutex2(param0) {
    result := DllCall("GDI32.dll\D3DKMTReleaseKeyedMutex2", D3DKMT_RELEASEKEYEDMUTEX2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CONFIGURESHAREDRESOURCE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTConfigureSharedResource(param0) {
    result := DllCall("GDI32.dll\D3DKMTConfigureSharedResource", D3DKMT_CONFIGURESHAREDRESOURCE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETOVERLAYSTATE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetOverlayState(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetOverlayState", D3DKMT_GETOVERLAYSTATE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CHECKSHAREDRESOURCEACCESS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCheckSharedResourceAccess(param0) {
    result := DllCall("GDI32.dll\D3DKMTCheckSharedResourceAccess", D3DKMT_CHECKSHAREDRESOURCEACCESS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OFFERALLOCATIONS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOfferAllocations(param0) {
    result := DllCall("GDI32.dll\D3DKMTOfferAllocations", D3DKMT_OFFERALLOCATIONS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_RECLAIMALLOCATIONS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTReclaimAllocations(param0) {
    result := DllCall("GDI32.dll\D3DKMTReclaimAllocations", D3DKMT_RECLAIMALLOCATIONS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATE_OUTPUTDUPL>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateOutputDupl(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateOutputDupl", D3DKMT_CREATE_OUTPUTDUPL.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROY_OUTPUTDUPL>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyOutputDupl(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyOutputDupl", D3DKMT_DESTROY_OUTPUTDUPL.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OUTPUTDUPL_GET_FRAMEINFO>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOutputDuplGetFrameInfo(param0) {
    result := DllCall("GDI32.dll\D3DKMTOutputDuplGetFrameInfo", D3DKMT_OUTPUTDUPL_GET_FRAMEINFO.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OUTPUTDUPL_METADATA>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOutputDuplGetMetaData(param0) {
    result := DllCall("GDI32.dll\D3DKMTOutputDuplGetMetaData", D3DKMT_OUTPUTDUPL_METADATA.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OUTPUTDUPL_GET_POINTER_SHAPE_DATA>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOutputDuplGetPointerShapeData(param0) {
    result := DllCall("GDI32.dll\D3DKMTOutputDuplGetPointerShapeData", D3DKMT_OUTPUTDUPL_GET_POINTER_SHAPE_DATA.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OUTPUTDUPL_RELEASE_FRAME>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOutputDuplReleaseFrame(param0) {
    result := DllCall("GDI32.dll\D3DKMTOutputDuplReleaseFrame", D3DKMT_OUTPUTDUPL_RELEASE_FRAME.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OUTPUTDUPLPRESENT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOutputDuplPresent(param0) {
    result := DllCall("GDI32.dll\D3DKMTOutputDuplPresent", D3DKMT_OUTPUTDUPLPRESENT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_ENUMADAPTERS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTEnumAdapters(param0) {
    result := DllCall("GDI32.dll\D3DKMTEnumAdapters", D3DKMT_ENUMADAPTERS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_ENUMADAPTERS2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTEnumAdapters2(param0) {
    result := DllCall("GDI32.dll\D3DKMTEnumAdapters2", D3DKMT_ENUMADAPTERS2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENADAPTERFROMLUID>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenAdapterFromLuid(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenAdapterFromLuid", D3DKMT_OPENADAPTERFROMLUID.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYREMOTEVIDPNSOURCEFROMGDIDISPLAYNAME>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryRemoteVidPnSourceFromGdiDisplayName(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryRemoteVidPnSourceFromGdiDisplayName", D3DKMT_QUERYREMOTEVIDPNSOURCEFROMGDIDISPLAYNAME.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETVIDPNSOURCEOWNER1>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetVidPnSourceOwner1(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetVidPnSourceOwner1", D3DKMT_SETVIDPNSOURCEOWNER1.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_WAITFORVERTICALBLANKEVENT2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTWaitForVerticalBlankEvent2(param0) {
    result := DllCall("GDI32.dll\D3DKMTWaitForVerticalBlankEvent2", D3DKMT_WAITFORVERTICALBLANKEVENT2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETSYNCREFRESHCOUNTWAITTARGET>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetSyncRefreshCountWaitTarget(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetSyncRefreshCountWaitTarget", D3DKMT_SETSYNCREFRESHCOUNTWAITTARGET.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETVERTICALBLANKEVENT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetDWMVerticalBlankEvent(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetDWMVerticalBlankEvent", D3DKMT_GETVERTICALBLANKEVENT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_PRESENT_MULTIPLANE_OVERLAY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTPresentMultiPlaneOverlay(param0) {
    result := DllCall("GDI32.dll\D3DKMTPresentMultiPlaneOverlay", D3DKMT_PRESENT_MULTIPLANE_OVERLAY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETSHAREDRESOURCEADAPTERLUID>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetSharedResourceAdapterLuid(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetSharedResourceAdapterLuid", D3DKMT_GETSHAREDRESOURCEADAPTERLUID.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCheckMultiPlaneOverlaySupport(param0) {
    result := DllCall("GDI32.dll\D3DKMTCheckMultiPlaneOverlaySupport", D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETCONTEXTINPROCESSSCHEDULINGPRIORITY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetContextInProcessSchedulingPriority(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetContextInProcessSchedulingPriority", D3DKMT_SETCONTEXTINPROCESSSCHEDULINGPRIORITY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETCONTEXTINPROCESSSCHEDULINGPRIORITY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetContextInProcessSchedulingPriority(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetContextInProcessSchedulingPriority", D3DKMT_GETCONTEXTINPROCESSSCHEDULINGPRIORITY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DDDI_MAKERESIDENT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTMakeResident(param0) {
    result := DllCall("GDI32.dll\D3DKMTMakeResident", D3DDDI_MAKERESIDENT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_EVICT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTEvict(param0) {
    result := DllCall("GDI32.dll\D3DKMTEvict", D3DKMT_EVICT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMCPU>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTWaitForSynchronizationObjectFromCpu(param0) {
    result := DllCall("GDI32.dll\D3DKMTWaitForSynchronizationObjectFromCpu", D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMCPU.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMCPU>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSignalSynchronizationObjectFromCpu(param0) {
    result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObjectFromCpu", D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMCPU.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMGPU>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTWaitForSynchronizationObjectFromGpu(param0) {
    result := DllCall("GDI32.dll\D3DKMTWaitForSynchronizationObjectFromGpu", D3DKMT_WAITFORSYNCHRONIZATIONOBJECTFROMGPU.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSignalSynchronizationObjectFromGpu(param0) {
    result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObjectFromGpu", D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSignalSynchronizationObjectFromGpu2(param0) {
    result := DllCall("GDI32.dll\D3DKMTSignalSynchronizationObjectFromGpu2", D3DKMT_SIGNALSYNCHRONIZATIONOBJECTFROMGPU2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEPAGINGQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreatePagingQueue(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreatePagingQueue", D3DKMT_CREATEPAGINGQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DDDI_DESTROYPAGINGQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyPagingQueue(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyPagingQueue", D3DDDI_DESTROYPAGINGQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_LOCK2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTLock2(param0) {
    result := DllCall("GDI32.dll\D3DKMTLock2", D3DKMT_LOCK2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_UNLOCK2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTUnlock2(param0) {
    result := DllCall("GDI32.dll\D3DKMTUnlock2", D3DKMT_UNLOCK2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_INVALIDATECACHE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTInvalidateCache(param0) {
    result := DllCall("GDI32.dll\D3DKMTInvalidateCache", D3DKMT_INVALIDATECACHE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DDDI_MAPGPUVIRTUALADDRESS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTMapGpuVirtualAddress(param0) {
    result := DllCall("GDI32.dll\D3DKMTMapGpuVirtualAddress", D3DDDI_MAPGPUVIRTUALADDRESS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DDDI_RESERVEGPUVIRTUALADDRESS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTReserveGpuVirtualAddress(param0) {
    result := DllCall("GDI32.dll\D3DKMTReserveGpuVirtualAddress", D3DDDI_RESERVEGPUVIRTUALADDRESS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_FREEGPUVIRTUALADDRESS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTFreeGpuVirtualAddress(param0) {
    result := DllCall("GDI32.dll\D3DKMTFreeGpuVirtualAddress", D3DKMT_FREEGPUVIRTUALADDRESS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_UPDATEGPUVIRTUALADDRESS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTUpdateGpuVirtualAddress(param0) {
    result := DllCall("GDI32.dll\D3DKMTUpdateGpuVirtualAddress", D3DKMT_UPDATEGPUVIRTUALADDRESS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DDDI_GETRESOURCEPRESENTPRIVATEDRIVERDATA>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetResourcePresentPrivateDriverData(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetResourcePresentPrivateDriverData", D3DDDI_GETRESOURCEPRESENTPRIVATEDRIVERDATA.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATECONTEXTVIRTUAL>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateContextVirtual(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateContextVirtual", D3DKMT_CREATECONTEXTVIRTUAL.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SUBMITCOMMAND>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSubmitCommand(param0) {
    result := DllCall("GDI32.dll\D3DKMTSubmitCommand", D3DKMT_SUBMITCOMMAND.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENSYNCOBJECTFROMNTHANDLE2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenSyncObjectFromNtHandle2(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenSyncObjectFromNtHandle2", D3DKMT_OPENSYNCOBJECTFROMNTHANDLE2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENSYNCOBJECTNTHANDLEFROMNAME>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenSyncObjectNtHandleFromName(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenSyncObjectNtHandleFromName", D3DKMT_OPENSYNCOBJECTNTHANDLEFROMNAME.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYVIDEOMEMORYINFO>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryVideoMemoryInfo(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryVideoMemoryInfo", D3DKMT_QUERYVIDEOMEMORYINFO.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CHANGEVIDEOMEMORYRESERVATION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTChangeVideoMemoryReservation(param0) {
    result := DllCall("GDI32.dll\D3DKMTChangeVideoMemoryReservation", D3DKMT_CHANGEVIDEOMEMORYRESERVATION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_REGISTERTRIMNOTIFICATION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTRegisterTrimNotification(param0) {
    result := DllCall("GDI32.dll\D3DKMTRegisterTrimNotification", D3DKMT_REGISTERTRIMNOTIFICATION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_UNREGISTERTRIMNOTIFICATION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTUnregisterTrimNotification(param0) {
    result := DllCall("GDI32.dll\D3DKMTUnregisterTrimNotification", D3DKMT_UNREGISTERTRIMNOTIFICATION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCheckMultiPlaneOverlaySupport2(param0) {
    result := DllCall("GDI32.dll\D3DKMTCheckMultiPlaneOverlaySupport2", D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_PRESENT_MULTIPLANE_OVERLAY2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTPresentMultiPlaneOverlay2(param0) {
    result := DllCall("GDI32.dll\D3DKMTPresentMultiPlaneOverlay2", D3DKMT_PRESENT_MULTIPLANE_OVERLAY2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_RECLAIMALLOCATIONS2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTReclaimAllocations2(param0) {
    result := DllCall("GDI32.dll\D3DKMTReclaimAllocations2", D3DKMT_RECLAIMALLOCATIONS2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETSTABLEPOWERSTATE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetStablePowerState(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetStablePowerState", D3DKMT_SETSTABLEPOWERSTATE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYCLOCKCALIBRATION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryClockCalibration(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryClockCalibration", D3DKMT_QUERYCLOCKCALIBRATION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYVIDPNEXCLUSIVEOWNERSHIP>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryVidPnExclusiveOwnership(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryVidPnExclusiveOwnership", D3DKMT_QUERYVIDPNEXCLUSIVEOWNERSHIP.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_ADJUSTFULLSCREENGAMMA>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTAdjustFullscreenGamma(param0) {
    result := DllCall("GDI32.dll\D3DKMTAdjustFullscreenGamma", D3DKMT_ADJUSTFULLSCREENGAMMA.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETVIDPNSOURCEHWPROTECTION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetVidPnSourceHwProtection(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetVidPnSourceHwProtection", D3DKMT_SETVIDPNSOURCEHWPROTECTION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_MARKDEVICEASERROR>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTMarkDeviceAsError(param0) {
    result := DllCall("GDI32.dll\D3DKMTMarkDeviceAsError", D3DKMT_MARKDEVICEASERROR.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_FLUSHHEAPTRANSITIONS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTFlushHeapTransitions(param0) {
    result := DllCall("GDI32.dll\D3DKMTFlushHeapTransitions", D3DKMT_FLUSHHEAPTRANSITIONS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETHWPROTECTIONTEARDOWNRECOVERY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetHwProtectionTeardownRecovery(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetHwProtectionTeardownRecovery", D3DKMT_SETHWPROTECTIONTEARDOWNRECOVERY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYPROCESSOFFERINFO>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryProcessOfferInfo(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryProcessOfferInfo", D3DKMT_QUERYPROCESSOFFERINFO.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_TRIMPROCESSCOMMITMENT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTTrimProcessCommitment(param0) {
    result := DllCall("GDI32.dll\D3DKMTTrimProcessCommitment", D3DKMT_TRIMPROCESSCOMMITMENT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DDDI_UPDATEALLOCPROPERTY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTUpdateAllocationProperty(param0) {
    result := DllCall("GDI32.dll\D3DKMTUpdateAllocationProperty", D3DDDI_UPDATEALLOCPROPERTY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT3>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCheckMultiPlaneOverlaySupport3(param0) {
    result := DllCall("GDI32.dll\D3DKMTCheckMultiPlaneOverlaySupport3", D3DKMT_CHECKMULTIPLANEOVERLAYSUPPORT3.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_PRESENT_MULTIPLANE_OVERLAY3>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTPresentMultiPlaneOverlay3(param0) {
    result := DllCall("GDI32.dll\D3DKMTPresentMultiPlaneOverlay3", D3DKMT_PRESENT_MULTIPLANE_OVERLAY3.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETFSEBLOCK>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetFSEBlock(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetFSEBlock", D3DKMT_SETFSEBLOCK.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYFSEBLOCK>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryFSEBlock(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryFSEBlock", D3DKMT_QUERYFSEBLOCK.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEHWCONTEXT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateHwContext(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateHwContext", D3DKMT_CREATEHWCONTEXT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYHWCONTEXT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyHwContext(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyHwContext", D3DKMT_DESTROYHWCONTEXT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEHWQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateHwQueue(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateHwQueue", D3DKMT_CREATEHWQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYHWQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyHwQueue(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyHwQueue", D3DKMT_DESTROYHWQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SUBMITCOMMANDTOHWQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSubmitCommandToHwQueue(param0) {
    result := DllCall("GDI32.dll\D3DKMTSubmitCommandToHwQueue", D3DKMT_SUBMITCOMMANDTOHWQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SUBMITWAITFORSYNCOBJECTSTOHWQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSubmitWaitForSyncObjectsToHwQueue(param0) {
    result := DllCall("GDI32.dll\D3DKMTSubmitWaitForSyncObjectsToHwQueue", D3DKMT_SUBMITWAITFORSYNCOBJECTSTOHWQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SUBMITSIGNALSYNCOBJECTSTOHWQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSubmitSignalSyncObjectsToHwQueue(param0) {
    result := DllCall("GDI32.dll\D3DKMTSubmitSignalSyncObjectsToHwQueue", D3DKMT_SUBMITSIGNALSYNCOBJECTSTOHWQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETALLOCATIONPRIORITY>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetAllocationPriority(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetAllocationPriority", D3DKMT_GETALLOCATIONPRIORITY.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GET_MULTIPLANE_OVERLAY_CAPS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetMultiPlaneOverlayCaps(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetMultiPlaneOverlayCaps", D3DKMT_GET_MULTIPLANE_OVERLAY_CAPS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GET_POST_COMPOSITION_CAPS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetPostCompositionCaps(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetPostCompositionCaps", D3DKMT_GET_POST_COMPOSITION_CAPS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_PRESENT_REDIRECTED>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTPresentRedirected(param0) {
    result := DllCall("GDI32.dll\D3DKMTPresentRedirected", D3DKMT_PRESENT_REDIRECTED.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SETVIDPNSOURCEOWNER2>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetVidPnSourceOwner2(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetVidPnSourceOwner2", D3DKMT_SETVIDPNSOURCEOWNER2.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SET_COLORSPACE_TRANSFORM>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSetMonitorColorSpaceTransform(param0) {
    result := DllCall("GDI32.dll\D3DKMTSetMonitorColorSpaceTransform", D3DKMT_SET_COLORSPACE_TRANSFORM.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CREATEPROTECTEDSESSION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCreateProtectedSession(param0) {
    result := DllCall("GDI32.dll\D3DKMTCreateProtectedSession", D3DKMT_CREATEPROTECTEDSESSION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_DESTROYPROTECTEDSESSION>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTDestroyProtectedSession(param0) {
    result := DllCall("GDI32.dll\D3DKMTDestroyProtectedSession", D3DKMT_DESTROYPROTECTEDSESSION.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYPROTECTEDSESSIONSTATUS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryProtectedSessionStatus(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryProtectedSessionStatus", D3DKMT_QUERYPROTECTEDSESSIONSTATUS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_QUERYPROTECTEDSESSIONINFOFROMNTHANDLE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTQueryProtectedSessionInfoFromNtHandle(param0) {
    result := DllCall("GDI32.dll\D3DKMTQueryProtectedSessionInfoFromNtHandle", D3DKMT_QUERYPROTECTEDSESSIONINFOFROMNTHANDLE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENPROTECTEDSESSIONFROMNTHANDLE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenProtectedSessionFromNtHandle(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenProtectedSessionFromNtHandle", D3DKMT_OPENPROTECTEDSESSIONFROMNTHANDLE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_GETPROCESSDEVICEREMOVALSUPPORT>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTGetProcessDeviceRemovalSupport(param0) {
    result := DllCall("GDI32.dll\D3DKMTGetProcessDeviceRemovalSupport", D3DKMT_GETPROCESSDEVICEREMOVALSUPPORT.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OPENKEYEDMUTEXFROMNTHANDLE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOpenKeyedMutexFromNtHandle(param0) {
    result := DllCall("GDI32.dll\D3DKMTOpenKeyedMutexFromNtHandle", D3DKMT_OPENKEYEDMUTEXFROMNTHANDLE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTRegisterVailProcess(param0) {
    result := DllCall("GDI32.dll\D3DKMTRegisterVailProcess", Guid.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SUBMITPRESENTBLTTOHWQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSubmitPresentBltToHwQueue(param0) {
    result := DllCall("api-ms-win-dx-d3dkmt-l1-1-4.dll\D3DKMTSubmitPresentBltToHwQueue", D3DKMT_SUBMITPRESENTBLTTOHWQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_SUBMITPRESENTTOHWQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTSubmitPresentToHwQueue(param0) {
    result := DllCall("api-ms-win-dx-d3dkmt-l1-1-4.dll\D3DKMTSubmitPresentToHwQueue", D3DKMT_SUBMITPRESENTTOHWQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_OUTPUTDUPLPRESENTTOHWQUEUE>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTOutputDuplPresentToHwQueue(param0) {
    result := DllCall("api-ms-win-dx-d3dkmt-l1-1-4.dll\D3DKMTOutputDuplPresentToHwQueue", D3DKMT_OUTPUTDUPLPRESENTTOHWQUEUE.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_ENUMADAPTERS3>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTEnumAdapters3(param0) {
    result := DllCall("api-ms-win-dx-d3dkmt-l1-1-6.dll\D3DKMTEnumAdapters3", D3DKMT_ENUMADAPTERS3.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<D3DKMT_CANCEL_PRESENTS>} param0 
 * @returns {NTSTATUS} 
 */
export D3DKMTCancelPresents(param0) {
    result := DllCall("GDI32.dll\D3DKMTCancelPresents", D3DKMT_CANCEL_PRESENTS.Ptr, param0, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

;@endregion Functions
