#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global _FACDXGI := 2170

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_CPU_ACCESS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_CPU_ACCESS_DYNAMIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_CPU_ACCESS_READ_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_CPU_ACCESS_SCRATCH := 3

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_CPU_ACCESS_FIELD := 15

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_FORMAT_DEFINED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_STANDARD_MULTISAMPLE_QUALITY_PATTERN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global DXGI_CENTER_MULTISAMPLE_QUALITY_PATTERN := 4294967294
;@endregion Constants
