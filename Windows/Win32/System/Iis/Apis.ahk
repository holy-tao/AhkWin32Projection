#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\HSE_VERSION_INFO.ahk" { HSE_VERSION_INFO }
#Import ".\HTTP_FILTER_VERSION.ahk" { HTTP_FILTER_VERSION }
#Import ".\HTTP_FILTER_CONTEXT.ahk" { HTTP_FILTER_CONTEXT }
#Import ".\EXTENSION_CONTROL_BLOCK.ahk" { EXTENSION_CONTROL_BLOCK }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Iis
 */

;@region Functions
/**
 * 
 * @param {Pointer<HSE_VERSION_INFO>} pVer 
 * @returns {BOOL} 
 */
export GetExtensionVersion(pVer) {
    result := DllCall("RpcProxy.dll\GetExtensionVersion", HSE_VERSION_INFO.Ptr, pVer, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<EXTENSION_CONTROL_BLOCK>} pECB 
 * @returns {Integer} 
 */
export HttpExtensionProc(pECB) {
    result := DllCall("RpcProxy.dll\HttpExtensionProc", EXTENSION_CONTROL_BLOCK.Ptr, pECB, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<HTTP_FILTER_CONTEXT>} pfc 
 * @param {Integer} NotificationType 
 * @param {Pointer<Void>} pvNotification 
 * @returns {Integer} 
 */
export HttpFilterProc(pfc, NotificationType, pvNotification) {
    pvNotificationMarshal := pvNotification is VarRef ? "ptr" : "ptr"

    result := DllCall("RpcProxy.dll\HttpFilterProc", HTTP_FILTER_CONTEXT.Ptr, pfc, "uint", NotificationType, pvNotificationMarshal, pvNotification, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<HTTP_FILTER_VERSION>} pVer 
 * @returns {BOOL} 
 */
export GetFilterVersion(pVer) {
    result := DllCall("RpcProxy.dll\GetFilterVersion", HTTP_FILTER_VERSION.Ptr, pVer, BOOL)
    return result
}

;@endregion Functions
