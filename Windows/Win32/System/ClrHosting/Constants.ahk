#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */

;@region Constants

/**
 * @type {String}
 */
export global DEPRECATED_CLR_API_MESG := "This API has been deprecated. Refer to https://go.microsoft.com/fwlink/?LinkId=143720 for more details."

/**
 * @type {Integer (UInt32)}
 */
export global CLR_MAJOR_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLR_MINOR_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLR_BUILD_VERSION := 22220

/**
 * @type {Integer (UInt32)}
 */
export global CLR_ASSEMBLY_MAJOR_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLR_ASSEMBLY_MINOR_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLR_ASSEMBLY_BUILD_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global BucketParamsCount := 10

/**
 * @type {Integer (UInt32)}
 */
export global BucketParamLength := 255

/**
 * @type {Guid}
 */
export global LIBID_mscoree := Guid("{5477469e-83b1-11d2-8b49-00a0c9b7c9c4}")

/**
 * @type {Guid}
 */
export global CLSID_CLRStrongName := Guid("{b79b0acd-f5cd-409b-b5a5-a16244610b92}")

/**
 * @type {Guid}
 */
export global CLSID_CLRMetaHost := Guid("{9280188d-0e8e-4867-b30c-7fa83884e8de}")

/**
 * @type {Guid}
 */
export global CLSID_CLRMetaHostPolicy := Guid("{2ebcd49a-1b47-4a61-b13a-4a03701e594b}")

/**
 * @type {Guid}
 */
export global CLSID_CLRDebugging := Guid("{bacc578d-fbdd-48a4-969f-02d932b74634}")

/**
 * @type {Guid}
 */
export global CLSID_CLRDebuggingLegacy := Guid("{df8395b5-a4ba-450b-a77c-a9a47762c520}")

/**
 * @type {Guid}
 */
export global CLSID_CLRProfiling := Guid("{bd097ed8-733e-43fe-8ed7-a95ff9a8448c}")
;@endregion Constants
