#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global INCLUDED_FCI := 1

/**
 * @type {Integer (UInt32)}
 */
export global _A_NAME_IS_UTF := 128

/**
 * @type {Integer (UInt32)}
 */
export global _A_EXEC := 64

/**
 * @type {Integer (UInt32)}
 */
export global statusFile := 0

/**
 * @type {Integer (UInt32)}
 */
export global statusFolder := 1

/**
 * @type {Integer (UInt32)}
 */
export global statusCabinet := 2

/**
 * @type {Integer (UInt32)}
 */
export global INCLUDED_TYPES_FCI_FDI := 1

/**
 * @type {Integer (Int32)}
 */
export global CB_MAX_DISK := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global CB_MAX_FILENAME := 256

/**
 * @type {Integer (UInt32)}
 */
export global CB_MAX_CABINET_NAME := 256

/**
 * @type {Integer (UInt32)}
 */
export global CB_MAX_CAB_PATH := 256

/**
 * @type {Integer (UInt32)}
 */
export global CB_MAX_DISK_NAME := 256

/**
 * @type {Integer (UInt32)}
 */
export global tcompMASK_TYPE := 15

/**
 * @type {Integer (UInt32)}
 */
export global tcompTYPE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global tcompTYPE_MSZIP := 1

/**
 * @type {Integer (UInt32)}
 */
export global tcompTYPE_QUANTUM := 2

/**
 * @type {Integer (UInt32)}
 */
export global tcompTYPE_LZX := 3

/**
 * @type {Integer (UInt32)}
 */
export global tcompBAD := 15

/**
 * @type {Integer (UInt32)}
 */
export global tcompMASK_LZX_WINDOW := 7936

/**
 * @type {Integer (UInt32)}
 */
export global tcompLZX_WINDOW_LO := 3840

/**
 * @type {Integer (UInt32)}
 */
export global tcompLZX_WINDOW_HI := 5376

/**
 * @type {Integer (UInt32)}
 */
export global tcompSHIFT_LZX_WINDOW := 8

/**
 * @type {Integer (UInt32)}
 */
export global tcompMASK_QUANTUM_LEVEL := 240

/**
 * @type {Integer (UInt32)}
 */
export global tcompQUANTUM_LEVEL_LO := 16

/**
 * @type {Integer (UInt32)}
 */
export global tcompQUANTUM_LEVEL_HI := 112

/**
 * @type {Integer (UInt32)}
 */
export global tcompSHIFT_QUANTUM_LEVEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global tcompMASK_QUANTUM_MEM := 7936

/**
 * @type {Integer (UInt32)}
 */
export global tcompQUANTUM_MEM_LO := 2560

/**
 * @type {Integer (UInt32)}
 */
export global tcompQUANTUM_MEM_HI := 5376

/**
 * @type {Integer (UInt32)}
 */
export global tcompSHIFT_QUANTUM_MEM := 8

/**
 * @type {Integer (UInt32)}
 */
export global tcompMASK_RESERVED := 57344

/**
 * @type {Integer (UInt32)}
 */
export global INCLUDED_FDI := 1
;@endregion Constants
